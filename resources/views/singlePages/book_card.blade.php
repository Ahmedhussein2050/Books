<div class="col-md-4 mb-5">
    <div class="card" style="width: 18rem;">
        <img src="{{asset($book->images->first()->name)}}" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">{{$book->data->first()->title}}</h5>
            <h5 class="card-title {{$book->status == 1? 'badge badge-success' : 'badge badge-danger'}}">{{$book->status == 1? 'available' : 'not available'}}</h5>
            <ul class="list-group list-group-flush">
                @foreach($book->tags as $tag)
                    <li class="list-group-item">{{$tag->name}}</li>
                @endforeach
            </ul>
            <p class="card-text">{{$book->data->first()->description}}</p>
            @if($book->status == 1)
                <a href="{{route('add_to_cart')}}" data-id="{{$book->id}}" data-cart="add" class="btn btn-primary btn-sm add_cart {{\App\Bll\Utility::check_in_cart(auth()->user(), $book->id)}}" >order</a>
            @endif
        </div>
    </div>
</div>
