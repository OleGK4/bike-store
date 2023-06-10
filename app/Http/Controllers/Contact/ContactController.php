<?php
namespace App\Http\Controllers\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Validator;

class ContactController extends BaseController
{
    public function sendMessage(Request $request)
    {
        $data = $request->json()->all();

        $validator = Validator::make($data, [
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required',
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            return response()->json(['errors' => $errors], 422);
        }

        $messageContent = "Contact form header\n\n";
        $messageContent .= "Name: " . $data['name'] . "\n";
        $messageContent .= "Email: " . $data['email'] . "\n";
        $messageContent .= "Message: " . $data['message'] . "\n";

        Mail::raw($messageContent, function ($message) use ($data) {
            $message->to('amiga.labiga@gmail.com')
//            $message->to('shesler2003@mail.ru')
                ->subject('Contact form header');
            $message->from($data['email'], $data['name']);
        });

        return response()->json(['message' => 'Message sent successfully']);
    }
}
