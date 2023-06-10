{{--Здесь должна быть ссылка подтверждения на роут front-end, но её пока что нет :( --}}

<h1>Forget Password Email</h1>

You can reset password from bellow link:
{{--<a href="{{ route('reset.password.get', $token) }}">Reset Password</a>--}}
<b>{{ $token }}</b>
{{--Это должна быть ссылка, но это токен, поскольку фронта пока что нет,
 а костылить фронт сам - не хочу--}}
