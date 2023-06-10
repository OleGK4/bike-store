{{--Здесь должна быть ссылка подтверждения на роут front-end, но её пока что нет :( --}}

<h1>Email Verification Mail</h1>

Please verify your email with bellow link:
<a href="{{ route('user.verify', $token) }}">Verify Email</a>
