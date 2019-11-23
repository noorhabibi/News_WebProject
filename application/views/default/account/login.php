<div class="row">
    <div class="col-md-6">
        <form method="post" action="<?php echo base_url('index.php/account/login'); ?>">
            <h3>Log into your account</h3>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="Email address" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Password" class="form-control" />
            </div>
            <button type="suubmit" class="btn btn-primary">Log in</button> 
        </form>
    </div>
    <div class="col-md-6">
        <h3>Create an account</h3>
        <form method="post" action="<?php echo base_url('index.php/account/signup'); ?>">
            <div class="form-group">
                <label for="signup_email">Email</label>
                <input type="email" name="email" id="signup_email" placeholder="Valid email address" class="form-control" />
            </div>
            <div class="form-group">
                <label for="pass">password</label>
                <input type="password" name="password" id="pass" class="form-control" />
            </div>
            <div class="form-group">
                <label for="cpass">confirm password</label>
                <input type="password" name="confirm_password" id="cpass" class="form-control" />
            </div>
            
            <button type="submit" class="btn btn-primary">Sign up</button>
        </form>
    </div>
</div>