@extends('layouts.app')
@section('content')
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Status</th>
                <th scope="col">Days</th>
                <th scope="col">Books</th>
                <th scope="col">Creation Date</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            @if($orders)
                @foreach($orders as $order)
                    <tr>
                        <th scope="row">{{$order->id}}</th>
                        <td><p class="badge {{$order->status->name == 'Wait'? 'badge-warning':$order->status->name == 'Borrowed'? 'badge-success' : ''}}{{$order->status->name == 'Complete'? 'badge-primary' : ''}}{{$order->status->name == 'Refused'? 'badge-danger' : ''}}{{$order->status->name == 'Refund-Refused'? 'badge-danger' : ''}}{{$order->status->name == 'Refund'? 'badge-info' : ''}}">{{$order->status->name}}</p></td>
                        <td>{{$order->days}}</td>
                        <td>
                            <table>
                                @foreach($order->books as $book)
                                    <tr>
                                        <td><img style="width: 50px; height: 35px" class="image-fluid" src="{{asset($book->images->first()->name)}}" alt=""></td>
                                        <td>{{$book->data->first()->title}}</td>
                                    </tr>
                                @endforeach
                            </table>
                        </td>
                        <td>{{$order->created_at}}</td>
                        <td>
                            @if($order->status->name == 'Wait')
                                <button class="btn btn-info btn-sm order-status" data-id="{{$order->id}}"
                                        data-status="Borrowed">Accept
                                </button>
                                <button class="btn btn-info btn-sm order-status" data-id="{{$order->id}}"
                                        data-status="Refused">Refuse
                                </button>
                            @endif
                                @if($order->status->name == 'Refund')
                                    <button class="btn btn-info btn-sm order-status" data-id="{{$order->id}}"
                                            data-status="Complete">Accept
                                    </button>
                                    <button class="btn btn-info btn-sm order-status" data-id="{{$order->id}}"
                                            data-status="Refund-Refused">Refuse
                                    </button>
                                @endif
                        </td>
                    </tr>
                @endforeach
            @endif
            </tbody>
        </table>
    </div>
@endsection
@push('script')
    <script>
        $(document).on('click', '.order-status', function () {
            let status = $(this).data('status')
            let id = $(this).data('id')

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('update_status')}}",
                method: 'post',
                data: {
                    "_token": "{{ csrf_token() }}",
                    status: status,
                    id: id
                },
                success: function () {
                    window.location.reload()
                }
            })

        })
    </script>
@endpush
