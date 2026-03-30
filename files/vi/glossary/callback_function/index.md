---
title: Hàm gọi lại
slug: Glossary/Callback_function
page-type: glossary-definition
sidebar: glossarysidebar
---

**Hàm gọi lại** (callback) là một hàm được truyền vào một hàm khác như một đối số, sau đó được gọi bên trong hàm bên ngoài để hoàn thành một quy trình hoặc hành động nào đó.

Người dùng API dựa trên callback viết một hàm được truyền vào API. Nhà cung cấp API (được gọi là _caller_ - người gọi) nhận hàm và gọi lại (hoặc thực thi) hàm đó tại một thời điểm nào đó bên trong thân của caller. Caller chịu trách nhiệm truyền đúng các tham số vào hàm callback. Caller cũng có thể mong đợi một giá trị trả về cụ thể từ hàm callback, được sử dụng để hướng dẫn thêm hành vi của caller.

Có hai cách mà callback có thể được gọi: _đồng bộ_ và _bất đồng bộ_. Các callback đồng bộ được gọi ngay sau khi gọi hàm bên ngoài, không có bất kỳ tác vụ bất đồng bộ nào xen vào, trong khi các callback bất đồng bộ được gọi vào một thời điểm nào đó sau đó, sau khi một hoạt động {{glossary("asynchronous", "bất đồng bộ")}} đã hoàn thành.

Hiểu liệu callback được gọi đồng bộ hay bất đồng bộ đặc biệt quan trọng khi phân tích các tác dụng phụ. Xem xét ví dụ sau:

```js
let value = 1;

doSomething(() => {
  value = 2;
});

console.log(value); // 1 hay 2?
```

Nếu `doSomething` gọi callback đồng bộ, thì câu lệnh cuối cùng sẽ ghi `2` vì `value = 2` được thực thi đồng bộ; ngược lại, nếu callback là bất đồng bộ, câu lệnh cuối cùng sẽ ghi `1` vì `value = 2` chỉ được thực thi sau câu lệnh `console.log`.

Ví dụ về callback đồng bộ bao gồm các callback được truyền vào {{jsxref("Array.prototype.map()")}}, {{jsxref("Array.prototype.forEach()")}}, v.v. Ví dụ về callback bất đồng bộ bao gồm các callback được truyền vào {{domxref("Window.setTimeout", "setTimeout()")}} và {{jsxref("Promise.prototype.then()")}}. Đây là các triển khai mẫu của `doSomething` gọi callback đồng bộ và bất đồng bộ:

```js
// Đồng bộ
function doSomething(callback) {
  callback();
}

// Bất đồng bộ
function doSomething(callback) {
  setTimeout(callback, 0);
}
```

Hướng dẫn [Sử dụng promise](/en-US/docs/Web/JavaScript/Guide/Using_promises#timing) có thêm thông tin về thời điểm của các callback bất đồng bộ.

## Xem thêm

- [Callback](<https://en.wikipedia.org/wiki/Callback_(computer_programming)>) trên Wikipedia
