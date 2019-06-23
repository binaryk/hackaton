<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Api\Comment;
use App\Models\Api\Dislike;
use App\Models\Api\Like;
use App\Models\Api\Question;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Comment::with('user')->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $comment = Comment::create($request->all());
        return Comment::with('user')->find($comment->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function questionComments(Request $request){
        return Comment::with('user')->where('question_id', $request->get('question_id'))->orderBy('id', 'desc')->get();
    }

    /**
     * Add like for question
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function like($id) {
        $question = Comment::find($id);

        $like = Like::where('user_id', auth()->user()->id)
            ->where('question_id', $question->id)
            ->where('type', 'comment')
            ->first();

        if ($like) {
            return response()->json([
                'status' => 400
            ]);
        }
        $l = new Like();
        $l->user_id = auth()->user()->id;
        $l->question_id = $question->id;
        $l->type = 'comment';
        $l->save();


        $likes = $question->likes;
        $likes++;
        $question->likes = $likes;

        $question->user()->increment('reputation');

        $question->save();

        return response()->json([
            'status' => 200
        ]);
    }

    public function answer($id) {
        // TODO: Trimite notificare la userul cui e intrebarea
        $comment = Comment::find($id);

        $question = Question::find($comment->question_id);
        $question->answer_user_id = auth()->user()->id;
        $question->answered = 1;
        $comment->isAnswer = 1;

        $question->save();
        $comment->save();

        return response()->json([
            'status' => 200
        ]);
    }

    /**
     * Add dislike for question
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function dislike($id) {
        $question = Comment::find($id);
        $dislike = Dislike::where('user_id', auth()->user()->id)
            ->where('question_id', $question->id)
            ->where('type', 'comment')
            ->first();

        if ($dislike) {
            return response()->json([
                'status' => 400
            ]);
        }
        $l = new Dislike();
        $l->user_id = auth()->user()->id;
        $l->question_id = $question->id;
        $l->type = 'comment';
        $l->save();
        $dislikes = $question->dislikes;
        $dislikes++;
        $question->dislikes = $dislikes;

        $question->user()->decrement('reputation');

        $question->save();

        return response()->json([
            'status' => 200
        ]);
    }
}
