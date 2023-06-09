import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IDataForm } from 'src/app/common/models/permissions.enum'

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  public formLogin!: FormGroup;
  public dataForm: IDataForm = { submitted: false };
  constructor(
    private formBuilder: FormBuilder
  ) {

  }
  ngOnInit(): void {
    this.formLogin = this.formBuilder.group({
      user: [null, [Validators.email, Validators.required, Validators.minLength(3), Validators.maxLength(80)]],
      password: [null, [Validators.required, Validators.minLength(3), Validators.maxLength(80)]],
    });
    console.log(this.formLogin)
  }
  public login(): void {
    this.dataForm = { ...this.dataForm, submitted: true };
    if (this.formLogin.valid) {
      let user = this.formLogin.value;
      console.log(user);
    }
  }
  get f() {
    return this.formLogin.controls;
  }
}

