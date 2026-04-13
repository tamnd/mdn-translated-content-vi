---
title: "WritableStreamDefaultController: phương thức error()"
short-title: error()
slug: Web/API/WritableStreamDefaultController/error
page-type: web-api-instance-method
browser-compat: api.WritableStreamDefaultController.error
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`error()`** của giao diện {{domxref("WritableStreamDefaultController")}} gây ra bất kỳ tương tác nào trong tương lai với luồng liên kết sẽ bị lỗi.

Phương thức này hiếm khi được sử dụng, vì thông thường chỉ cần trả về một promise bị từ chối từ một trong các phương thức của sink cơ bản là đủ. Tuy nhiên, nó có thể hữu ích để đột ngột tắt luồng để phản ứng với một sự kiện bên ngoài vòng đời bình thường của các tương tác với sink cơ bản.

## Cú pháp

```js-nolint
error(message)
```

### Tham số

- `message`
  - : Một chuỗi đại diện cho lỗi mà bạn muốn các tương tác trong tương lai thất bại.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Luồng bạn đang cố gắng báo lỗi không phải là một {{domxref("WritableStream")}}.

## Ví dụ

```js
const writableStream = new WritableStream({
  start(controller) {
    // do stuff with controller

    // error stream if necessary
    controller.error("My error is broken");
  },
  write(chunk, controller) {
    // …
  },
  close(controller) {
    // …
  },
  abort(err) {
    // …
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
