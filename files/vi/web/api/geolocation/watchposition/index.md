---
title: "Geolocation: phương thức watchPosition()"
short-title: watchPosition()
slug: Web/API/Geolocation/watchPosition
page-type: web-api-instance-method
browser-compat: api.Geolocation.watchPosition
---

{{securecontext_header}}{{ APIref("Geolocation API") }}

Phương thức **`watchPosition()`** của giao diện {{domxref("Geolocation")}} được dùng để đăng ký một hàm xử lý sẽ được gọi tự động mỗi khi vị trí của thiết bị thay đổi.
Bạn cũng có thể, tùy chọn, chỉ định một hàm callback xử lý lỗi.

Lưu ý rằng ngoài việc yêu cầu một ngữ cảnh an toàn, tính năng này còn có thể bị chặn bởi `Permissions-Policy` [`geolocation`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/geolocation), và cũng yêu cầu người dùng cấp quyền rõ ràng.
Nếu cần, người dùng sẽ được nhắc khi phương thức này được gọi.
Trạng thái quyền có thể được truy vấn bằng quyền người dùng `geolocation` trong [Permissions API](/en-US/docs/Web/API/Permissions_API).

## Cú pháp

```js-nolint
watchPosition(success)
watchPosition(success, error)
watchPosition(success, error, options)
```

### Tham số

- `success`
  - : Một hàm callback nhận một đối tượng {{domxref("GeolocationPosition")}} làm đối số đầu vào.
- `error` {{optional_inline}}
  - : Một hàm callback tùy chọn nhận một đối tượng {{domxref("GeolocationPositionError")}} làm đối số đầu vào.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn cung cấp các thiết lập cho việc theo dõi vị trí.
    Xem {{domxref("Geolocation.getCurrentPosition()")}} để biết thêm chi tiết về các tùy chọn có thể có.

### Giá trị trả về

Một ID số nguyên xác định hàm xử lý đã đăng ký.
ID này có thể được truyền cho {{domxref("Geolocation.clearWatch()")}} để hủy đăng ký hàm xử lý.

## Ví dụ

```js
let id;
let target;
let options;

function success(pos) {
  const crd = pos.coords;

  if (target.latitude === crd.latitude && target.longitude === crd.longitude) {
    console.log("Congratulations, you reached the target");
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

- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- Giao diện mà nó thuộc về, {{domxref("Geolocation")}}, và cách truy cập nó -
  {{domxref("Navigator.geolocation")}}.
- Thao tác ngược lại: {{domxref("Geolocation.clearWatch()")}}
- Một phương thức tương tự: {{domxref("Geolocation.getCurrentPosition()")}}
