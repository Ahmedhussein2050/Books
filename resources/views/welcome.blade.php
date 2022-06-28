@extends('layouts.app')
@section('content')
    <div class="container pb-5">
        <div class="row">
            @if(auth()->user() && auth()->user()->guard == 'admin')
                <div class="col-md-3">
                    <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal">Add New Book
                    </button>
                </div>
                <div class="col-md-3">
                    <a href="{{route('show_orders')}}" class="btn btn-warning btn-sm">
                       All Borrow Orders
                    </a>
                    <a href="{{route('show_refunds')}}" class="btn btn-warning btn-sm">
                        Refund Orders
                    </a>
                </div>
            @endif
                @if(auth()->user())
                    <div class="col-md-2">
                        <a href="{{route('my_orders')}}" class="btn btn-info btn-sm">
                            My Orders
                        </a>
                    </div>
                @endif
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <form action="{{route('addBook')}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group">
                                        <label for="author">Author</label>
                                        <input type="text" class="form-control" name="author" id="author">
                                    </div>
                                    <div class="form-group">
                                        <label for="isbn">ISBN</label>
                                        <input type="text" class="form-control" name="isbn" id="isbn">
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Availability</label>
                                        <input type="checkbox" class="form-control" name="status" id="status">
                                    </div>
                                    <div class="form-group">
                                        <label for="title">Title</label>
                                        <input type="text" class="form-control" name="title" id="title">
                                    </div>
                                    <div class="form-group">
                                        <label for="desc">Desc</label>
                                        <input type="text" class="form-control" name="desc" id="desc">
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Images</label>
                                        <input type="file" name="images[]" multiple>
                                    </div>
                                    <div class="form-group">
                                        <label for="tag">Tags</label>
                                        <input placeholder="add ',' between tags with no spaces" type="text"
                                               class="form-control" name="tags" id="tag">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <div class="container">
        @if($books != null || $books != [] || $books)
            <div class="row">
                @foreach($books as $book)
                    @include('singlePages.book_card')
                @endforeach
            </div>
        @else
            <div class="row">
                <div class="col-md-12 text-center">
                    Sorry There Is No Books Available Yet, You Can Visit Us After The Owners Add Books.
                </div>
            </div>
        @endif
    </div>
@endsection
@push('script')
    <script>
        $(document).on('click', '[data-cart=add]', function (e) {
            e.preventDefault()
            let id = '{{auth()->user()?auth()->user()->id : ''}}'
            let book_id = ''
            if(id){
                book_id = $(this).data('id')
                $(this).addClass('disabled')
                $(this).html('')
                $(this).html('ordered')
            }else {
                window.location.href = '{{url('login')}}'
            }

            $.ajax({
                url: "{{route('add_to_cart')}}",
                method: 'post',
                data: {
                    'user_id': '{{auth()->user()?auth()->user()->id: ''}}',
                    'book_id': book_id,
                    '_token': '{{csrf_token()}}'
                }
            })
        })
    </script>
@endpush
