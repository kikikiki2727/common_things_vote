import Vue from 'vue'

import { extend, ValidationProvider, ValidationObserver } from 'vee-validate'

import { required, email, confirmed, min } from 'vee-validate/dist/rules'

extend('required', {
  ...required,
  message: "{_field_}は必須項目です"
});

extend('email', {
  ...email,
  message: "{_field_}の形式で入力してください"
});

extend('confirmed', {
  ...confirmed,
  message: "パスワードと一致しません"
});

extend('min', {
  ...min,
  params: ['length'],
  message: "{_field_}は{length}文字以上で入力してください"
});

Vue.component('ValidationProvider', ValidationProvider)
Vue.component('ValidationObserver', ValidationObserver)
