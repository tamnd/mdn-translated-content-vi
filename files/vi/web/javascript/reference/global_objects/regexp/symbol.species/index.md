---
title: RegExp[Symbol.species]
short-title: "[Symbol.species]"
slug: Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.species
page-type: javascript-static-accessor-property
browser-compat: javascript.builtins.RegExp.@@species
sidebar: jsref
---

Thuộc tính accessor static **`RegExp[Symbol.species]`** trả về constructor được dùng để tạo các regular expression được sao chép trong một số phương thức của `RegExp`.

> [!WARNING]
> Sự tồn tại của `[Symbol.species]` cho phép thực thi mã tùy ý và có thể tạo ra các lỗ hổng bảo mật. Nó cũng khiến một số tối ưu hóa trở nên khó khăn hơn nhiều. Các nhà phát triển engine đang [xem xét có nên loại bỏ tính năng này hay không](https://github.com/tc39/proposal-rm-builtin-subclassing). Hãy tránh phụ thuộc vào nó nếu có thể.

## Cú pháp

```js-nolint
RegExp[Symbol.species]
```

### Giá trị trả về

Giá trị của constructor (`this`) mà `get [Symbol.species]` được gọi trên đó. Giá trị trả về được dùng để tạo các instance `RegExp` được sao chép.

## Mô tả

Thuộc tính accessor `[Symbol.species]` trả về constructor mặc định cho các đối tượng `RegExp`. Các constructor của subclass có thể ghi đè nó để thay đổi việc gán constructor. Cài đặt mặc định về cơ bản là:

```js
// Cài đặt nền tảng giả định để minh họa
class RegExp {
  static get [Symbol.species]() {
    return this;
  }
}
```

Nhờ vào cài đặt đa hình này, `[Symbol.species]` của các subclass dẫn xuất cũng sẽ mặc định trả về chính constructor đó.

```js
class SubRegExp extends RegExp {}
SubRegExp[Symbol.species] === SubRegExp; // true
```

Một số phương thức của `RegExp` tạo bản sao của instance regex hiện tại trước khi chạy {{jsxref("RegExp/exec", "exec()")}}, để các side effect như thay đổi {{jsxref("RegExp/lastIndex", "lastIndex")}} không bị giữ lại. Thuộc tính `[Symbol.species]` được dùng để xác định constructor của instance mới. Các phương thức sao chép instance regex hiện tại là:

- [`[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)
- [`[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split)

## Ví dụ

### Species trong các đối tượng thông thường

Thuộc tính `[Symbol.species]` trả về hàm constructor mặc định, là constructor `RegExp` cho các đối tượng `RegExp`:

```js
RegExp[Symbol.species]; // function RegExp()
```

### Species trong các đối tượng dẫn xuất

Trong một instance của subclass `RegExp` tùy chỉnh, chẳng hạn `MyRegExp`, species của `MyRegExp` là constructor `MyRegExp`. Tuy nhiên, bạn có thể muốn ghi đè điều này để trả về các đối tượng `RegExp` cha trong các phương thức của lớp dẫn xuất:

```js
class MyRegExp extends RegExp {
  // Ghi đè species của MyRegExp thành constructor RegExp cha
  static get [Symbol.species]() {
    return RegExp;
  }
}
```

Hoặc bạn có thể dùng điều này để quan sát quá trình sao chép:

```js
class MyRegExp extends RegExp {
  constructor(...args) {
    console.log("Creating a new MyRegExp instance with args:", args);
    super(...args);
  }
  static get [Symbol.species]() {
    console.log("Copying MyRegExp");
    return this;
  }
  exec(value) {
    console.log("Executing with lastIndex:", this.lastIndex);
    return super.exec(value);
  }
}

Array.from("aabbccdd".matchAll(new MyRegExp("[ac]", "g")));
// Creating a new MyRegExp instance with args: [ '[ac]', 'g' ]
// Copying MyRegExp
// Creating a new MyRegExp instance with args: [ MyRegExp /[ac]/g, 'g' ]
// Executing with lastIndex: 0
// Executing with lastIndex: 1
// Executing with lastIndex: 2
// Executing with lastIndex: 5
// Executing with lastIndex: 6
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("RegExp")}}
- {{jsxref("Symbol.species")}}
