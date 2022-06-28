@extends('layouts.app')
@section('content')
    <h3>{{auth()->user()->name}}</h3>
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Book Image</th>
                <th scope="col">Book author</th>
                <th scope="col">Book title</th>
                <th scope="col">Borrow days</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            @if($carts)
                @foreach($carts as $cart)
                    <tr>
                        <td><img style="width: 50px; height: 35px" class="image-fluid"
                                 src="{{asset($cart->book->images->first()->name)}}" alt=""></td>
                        <td>{{$cart->book->author}}</td>
                        <td>
                            {{$cart->book->data->first()->title}}
                        </td>
                        <td>
                            <input placeholder="Borrow days" id="borrow-days" value="{{$cart->days}}" name="borrow-days"
                                   class="form-control w-50" type="number">
                        </td>
                        <td>
                            <button data-id="{{$cart->id}}" class="btn btn-danger btn-sm delete-cart">Delete</button>
                        </td>
                    </tr>
                @endforeach
            @endif
            </tbody>
        </table>
        @if($carts->first())
            <form action="{{route('confirm_order')}}" method="post">
                @csrf
                <button type="submit" class="btn btn-success btn-sm">Confirm Order</button>
            </form>
        @endif
    </div>
@endsection
@push('script')
    <script>
        $(document).on('click', '.delete-cart', function () {
            let id = $(this).data('id')
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('delete_cart')}}",
                method: 'post',
                data: {
                    "_token": "{{ csrf_token() }}",
                    id: id
                },
                success: function () {
                    window.location.reload()
                }
            })

        })
    </script>
@endpush
