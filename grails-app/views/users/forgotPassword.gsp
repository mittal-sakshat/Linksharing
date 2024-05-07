%{--<!DOCTYPE html>--}%
%{--<html lang="en" >--}%
%{--<head>--}%
%{--    <title>Home Page</title>--}%
%{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">--}%
%{--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>--}%

%{--    <!-- font awesome -->--}%
%{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />--}%
%{--    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--}%
%{--</head>--}%
%{--<style>--}%
%{--    .search-row{--}%
%{--    border:2px solid #aea4a4;--}%
%{-- border-radius:15px;--}%
%{--    }--}%
%{--    .navbar-brand{--}%
%{--    color:blue;--}%
%{--    }--}%

%{--    .recentShare,.postRow{--}%
%{--        border:2px solid #aea4a4;--}%
%{--        border-radius:5px;--}%
%{--     margin:10px;--}%

%{--    }--}%
%{--    .recentRow1,.postRow1{--}%
%{--        border-bottom:2px solid #aea4a4;--}%
%{--        margin:0px;--}%
%{--    }--}%

%{--    .recentShare img{--}%
%{--    width:94px;--}%
%{--    height:110px;--}%
%{--    padding:6px;--}%
%{--    }--}%
%{--     .postRow img{--}%
%{--   width:94px;--}%
%{--    height:110px;--}%
%{--        padding:6px;--}%

%{--    }--}%

%{--    .loginRow,.regisRow{--}%
%{--    padding-top:5px;--}%
%{--    border:2px solid #aea4a4;--}%
%{--        border-radius:5px;--}%
%{--     margin:10px;--}%
%{--    }--}%
%{--    .loginRow h6{--}%
%{--    border-bottom:2px solid #aea4a4;--}%
%{--    padding-bottom:7px;--}%
%{--    }--}%
%{--    .regisRow h6{--}%
%{--     border-bottom:2px solid #aea4a4;--}%
%{--    padding-bottom:7px;--}%
%{--    }--}%
%{--    .socialMedia a{--}%
%{--    padding:3px;--}%
%{--    }--}%
%{--</style>--}%
%{--<body>--}%
%{--<g:render template="/Templates/forgotPasswordTemplate"/>--}%
%{--</body>--}%
%{--</html>--}%

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forget Password</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<style>
.form-gap {
    padding-top: 70px;
}
</style>
<body>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<div class="form-gap"></div>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Forgot Password?</h2>
                        <p>You can reset your password here.</p>
                        <div class="panel-body">
                            <g:form controller="Login" action="sendingEmail">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input id="email" name="email" placeholder="email address" class="form-control"  type="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    %{--                                    <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">--}%
                                    <button name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">Reset Password</button>
                                </div>

                                <input type="hidden" class="hide" name="token" id="token" value="">
                            </g:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>