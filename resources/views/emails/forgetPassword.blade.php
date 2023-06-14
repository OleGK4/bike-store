{{--Здесь должна быть ссылка подтверждения на роут front-end, но её пока что нет :( --}}


{{--Это должна быть ссылка, но это токен, поскольку фронта пока что нет,
 а костылить фронт сам - не хочу--}}
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forget Password Email</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            font-size: 16px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 0px 5px rgba(0,0,0,0.1);
            border-radius: 5px;
            text-align: center;
        }
        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        p {
            margin-bottom: 20px;
        }
        a.btn {
            display: inline-block;
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        a.btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Forget Password Email</h1>
    <p>You can reset password from bellow button:</p>
{{--    <a class="btn" href="{{ route('reset.password.get', $token) }}">Reset Password</a>--}}
    <b>{{ $token }}</b>
</div>
</body>
</html>
