---
title: "Geolocation: phương thức clearWatch()"
short-title: clearWatch()
slug: Web/API/Geolocation/clearWatch
page-type: web-api-instance-method
browser-compat: api.Geolocation.clearWatch
---

{{securecontext_header}}{{ APIref("Geolocation API") }}

Phương thức **`clearWatch()`** của giao diện {{domxref("Geolocation")}} được dùng để hủy đăng ký các bộ xử lý giám sát vị trí/lỗi đã được cài đặt trước đó bằng {{domxref("Geolocation.watchPosition()")}}.

## Cú pháp

```js-nolint
clearWatch(id)
```

### Tham số

- `id`
  - : Số ID được trả về bởi phương thức {{domxref("Geolocation.watchPosition()")}} khi cài đặt bộ xử lý mà bạn muốn xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
let id;
let target;
let options;

function success(pos) {
  const crd = pos.coords;

  if (target.latitude === crd.latitude && target.longitude === crd.longitude) {
    console.log("Congratulations, you've reached the target!");
    navigator.geolocation.clearWatch(id);
  }
}

function error(err) {
  console.error(`ERROR(${err.code}): ${err.message}`);
}

target = {
  latitude: 0,
  longitude: 0,
};

options = {
  enableHighAccuracy: false,
  timeout: 5000,
  maximumAge: 0,
};

id = navigator.geolocation.watchPosition(success, error, options);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng geolocation](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- {{domxref("Geolocation")}}
- {{domxref("Geolocation.watchPosition()")}}
- {{domxref("Geolocation.getCurrentPosition()")}}
