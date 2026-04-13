---
title: "NavigatorUAData: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/NavigatorUAData/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.NavigatorUAData.toJSON
---

{{APIRef("User-Agent Client Hints API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Phương thức **`toJSON()`** của giao diện {{domxref("NavigatorUAData")}} là một _serializer_; nó trả về biểu diễn JSON của các thuộc tính _low entropy_ của đối tượng `NavigatorUAData`.

> [!NOTE]
> Các thuật ngữ _high entropy_ và _low entropy_ đề cập đến lượng thông tin mà các giá trị này tiết lộ về trình duyệt. Các giá trị low entropy được trả về bởi phương thức này là những giá trị không tiết lộ thông tin có thể nhận dạng người dùng. Các giá trị high entropy chỉ có thể được trả về bởi phương thức {{domxref("NavigatorUAData.getHighEntropyValues()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng JSON.

## Ví dụ

Ví dụ dưới đây in đối tượng JSON ra console.

```js
console.log(navigator.userAgentData.toJSON());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
