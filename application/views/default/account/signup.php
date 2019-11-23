<div class="row">
    <div class="col-md-12">
        <h3>Create an account</h3>
        <p class="alert bg-info">Don't have an account? Nothing to worry. Sign up below. It takes only few minutes.</p>
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