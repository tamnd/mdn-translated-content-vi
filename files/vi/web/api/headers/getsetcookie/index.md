---
title: "Headers: phương thức getSetCookie()"
short-title: getSetCookie()
slug: Web/API/Headers/getSetCookie
page-type: web-api-instance-method
browser-compat: api.Headers.getSetCookie
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`getSetCookie()`** của giao diện {{domxref("Headers")}} trả về một mảng chứa các giá trị của tất cả header {{httpheader("Set-Cookie")}} gắn với một response. Điều này cho phép đối tượng {{domxref("Headers")}} xử lý nhiều header `Set-Cookie`, điều mà trước khi phương thức này được triển khai là không thể.

Phương thức này được thiết kế để dùng trong môi trường máy chủ, ví dụ Node.js. Trình duyệt chặn mã JavaScript frontend truy cập header {{httpheader("Set-Cookie")}}, theo yêu cầu của Fetch spec, vốn định nghĩa `Set-Cookie` là một [forbidden response-header name](https://fetch.spec.whatwg.org/#forbidden-response-header-name) và [phải bị lọc ra](https://fetch.spec.whatwg.org/#ref-for-forbidden-response-header-name%E2%91%A0) khỏi mọi response được phơi bày cho mã frontend.

## Cú pháp

```js-nolint
getSetCookie()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng chuỗi biểu diễn giá trị của tất cả các header `Set-Cookie` khác nhau gắn với một response.

Nếu không có header `Set-Cookie` nào được đặt, phương thức sẽ trả về một mảng rỗng (`[ ]`).

## Ví dụ

Như đã nói ở trên, chạy mã kiểu sau trên phía client sẽ không trả về kết quả nào — `Set-Cookie` bị lọc khỏi các đối tượng {{domxref("Headers")}} lấy qua mạng.

```js
fetch("https://example.com").then((response) => {
  console.log(response.headers.getSetCookie());
  // No header values returned
});
```

Tuy nhiên, đoạn sau có thể dùng để truy vấn nhiều giá trị `Set-Cookie`. Nó hữu ích hơn nhiều ở phía server, nhưng cũng có thể chạy ở phía client.

```js
const headers = new Headers({
  "Set-Cookie": "name1=value1",
});

headers.append("Set-Cookie", "name2=value2");

headers.getSetCookie();
// Returns ["name1=value1", "name2=value2"]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTTP](/en-US/docs/Web/HTTP)
- {{httpheader("Set-Cookie")}}
