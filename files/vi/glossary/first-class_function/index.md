---
title: Hàm hạng nhất
slug: Glossary/First-class_Function
page-type: glossary-definition
sidebar: glossarysidebar
---

Một ngôn ngữ lập trình được gọi là có **hàm hạng nhất** (first-class functions) khi các hàm trong ngôn ngữ đó được đối xử như bất kỳ biến nào khác. Ví dụ, trong ngôn ngữ như vậy, một hàm có thể được truyền như đối số cho các hàm khác, có thể được trả về bởi một hàm khác và có thể được gán làm giá trị cho một biến.

## Ví dụ

### Gán hàm cho một biến

```js
const foo = () => {
  console.log("foobar");
};
foo(); // Gọi nó bằng cách sử dụng biến
// foobar
```

Chúng ta đã gán một _Hàm ẩn danh_ cho một {{glossary("Variable")}}, sau đó chúng ta sử dụng biến đó để gọi hàm bằng cách thêm dấu ngoặc đơn `()` ở cuối.

> [!NOTE]
> Ngay cả khi hàm của bạn có tên, bạn có thể sử dụng tên biến để gọi nó. Đặt tên sẽ hữu ích khi gỡ lỗi code. _Nhưng nó sẽ không ảnh hưởng đến cách chúng ta gọi nó._

### Truyền hàm như một đối số

```js
function sayHello() {
  return "Hello, ";
}
function greeting(helloMessage, name) {
  console.log(helloMessage() + name);
}
// Truyền `sayHello` như một đối số cho hàm `greeting`
greeting(sayHello, "JavaScript!");
// Hello, JavaScript!
```

Chúng ta đang truyền hàm `sayHello()` như một đối số cho hàm `greeting()`, điều này giải thích cách chúng ta đối xử với hàm như một giá trị.

> [!NOTE]
> Hàm mà chúng ta truyền như đối số cho một hàm khác được gọi là _{{glossary("callback function")}}_. _`sayHello()` là một callback function._

### Trả về một hàm

```js
function sayHello() {
  return () => {
    console.log("Hello!");
  };
}
```

Trong ví dụ này, chúng ta đang trả về một hàm từ một hàm khác - _Chúng ta có thể trả về một hàm vì các hàm trong JavaScript được đối xử như các giá trị._

> [!NOTE]
> Một hàm trả về một hàm hoặc nhận các hàm khác làm đối số được gọi là _hàm bậc cao_ (higher-order function).

## Xem thêm

- [First-class functions](https://en.wikipedia.org/wiki/First-class_function) trên Wikipedia
- Các thuật ngữ liên quan:
  - {{glossary("Callback function")}}
  - {{glossary("Function")}}
  - {{glossary("Variable")}}
