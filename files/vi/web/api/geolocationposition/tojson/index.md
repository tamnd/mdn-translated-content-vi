---
title: "GeolocationPosition: toJSON() method"
short-title: toJSON()
slug: Web/API/GeolocationPosition/toJSON
page-type: web-api-instance-method
browser-compat: api.GeolocationPosition.toJSON
---

{{APIRef("Geolocation API")}}

Phương thức **`toJSON()`** của giao diện {{domxref("GeolocationPosition")}} là một {{Glossary("Serialization","bộ tuần tự hóa")}}; nó trả về biểu diễn JSON của đối tượng {{domxref("GeolocationPosition")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là kết quả tuần tự hóa của đối tượng {{domxref("GeolocationPosition")}}.

## Ví dụ

### Sử dụng phương thức `toJSON()`

Trong ví dụ này, gọi `position.toJSON()` trả về biểu diễn JSON của đối tượng `GeolocationPosition`.

```js
navigator.geolocation.getCurrentPosition((position) => {
  console.log(position.toJSON());
});
```

Kết quả sẽ là một đối tượng JSON như sau:

```json
{
  "timestamp": 1717509611840,
  "coords": {
    "accuracy": 13.0,
    "latitude": 53.0,
    "longitude": 8.0,
    "altitude": null,
    "altitudeAccuracy": null,
    "heading": null,
    "speed": null
  }
}
```

Để lấy chuỗi JSON, bạn có thể dùng [`JSON.stringify(position)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify) trực tiếp; nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
