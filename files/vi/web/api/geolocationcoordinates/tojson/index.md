---
title: "GeolocationCoordinates: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/GeolocationCoordinates/toJSON
page-type: web-api-instance-method
browser-compat: api.GeolocationCoordinates.toJSON
---

{{APIRef("Geolocation API")}}

Phương thức **`toJSON()`** của giao diện {{domxref("GeolocationCoordinates")}} là một {{Glossary("Serialization","serializer")}}; nó trả về một biểu diễn JSON của đối tượng {{domxref("GeolocationCoordinates")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("JSON")}} là kết quả tuần tự hóa của đối tượng {{domxref("GeolocationCoordinates")}}.

## Ví dụ

### Dùng phương thức `toJSON()`

Trong ví dụ này, gọi `position.coords.toJSON()` sẽ trả về một biểu diễn JSON của đối tượng `GeolocationCoordinates`.

```js
navigator.geolocation.getCurrentPosition((position) => {
  console.log(position.coords.toJSON());
});
```

Lệnh này sẽ ghi ra một đối tượng JSON như sau:

```json
{
  "accuracy": 12.0,
  "latitude": 53.0,
  "longitude": 8.0,
  "altitude": null,
  "altitudeAccuracy": null,
  "heading": null,
  "speed": null
}
```

Để có một chuỗi JSON, bạn có thể dùng trực tiếp [`JSON.stringify(position.coords)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify); nó sẽ tự động gọi `toJSON()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("JSON")}}
