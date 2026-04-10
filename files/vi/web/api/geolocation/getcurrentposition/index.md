---
title: "Geolocation: phương thức getCurrentPosition()"
short-title: getCurrentPosition()
slug: Web/API/Geolocation/getCurrentPosition
page-type: web-api-instance-method
browser-compat: api.Geolocation.getCurrentPosition
---

{{securecontext_header}}{{APIRef("Geolocation API")}}

Phương thức **`getCurrentPosition()`** của giao diện {{domxref("Geolocation")}} được dùng để lấy vị trí hiện tại của thiết bị.

Lưu ý rằng ngoài việc yêu cầu một ngữ cảnh an toàn, tính năng này còn có thể bị chặn bởi `Permissions-Policy` [`geolocation`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/geolocation), và cũng yêu cầu người dùng cấp quyền rõ ràng.
Nếu cần, người dùng sẽ được nhắc khi phương thức này được gọi.
Trạng thái quyền có thể được truy vấn bằng quyền người dùng `geolocation` trong [Permissions API](/en-US/docs/Web/API/Permissions_API).

## Cú pháp

```js-nolint
getCurrentPosition(success)
getCurrentPosition(success, error)
getCurrentPosition(success, error, options)
```

### Tham số

- `success`
  - : Một hàm callback nhận một đối tượng {{domxref("GeolocationPosition")}} làm đối số đầu vào duy nhất.
- `error` {{optional_inline}}
  - : Một hàm callback tùy chọn nhận một đối tượng {{domxref("GeolocationPositionError")}} làm đối số đầu vào duy nhất.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn bao gồm các tham số sau:
    - `maximumAge` {{optional_inline}}
      - : Một giá trị `long` dương cho biết tuổi tối đa tính bằng mili giây của một vị trí có thể đã được lưu đệm mà vẫn chấp nhận trả về. Nếu đặt là `0`, điều đó có nghĩa là thiết bị không thể dùng vị trí đã lưu đệm và phải cố gắng lấy vị trí hiện tại thực sự. Nếu đặt là {{jsxref("Infinity")}} thiết bị phải trả về vị trí đã lưu đệm bất kể nó cũ bao nhiêu. Mặc định: `0`.
    - `timeout` {{optional_inline}}
      - : Một giá trị `long` dương biểu thị thời gian tối đa tính bằng mili giây mà thiết bị được phép dùng để trả về vị trí. Giá trị mặc định là {{jsxref("Infinity")}}, nghĩa là `getCurrentPosition()` sẽ không trả về cho đến khi vị trí khả dụng.
    - `enableHighAccuracy` {{optional_inline}}
      - : Một giá trị boolean cho biết ứng dụng muốn nhận kết quả tốt nhất có thể. Nếu là `true` và thiết bị có thể cung cấp vị trí chính xác hơn, nó sẽ làm vậy. Lưu ý rằng điều này có thể dẫn đến thời gian phản hồi chậm hơn hoặc tiêu thụ điện năng nhiều hơn (ví dụ với chip GPS trên thiết bị di động). Ngược lại, nếu là `false`, thiết bị có thể tiết kiệm tài nguyên bằng cách phản hồi nhanh hơn và/hoặc dùng ít điện hơn. Mặc định: `false`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0,
};

function success(pos) {
  const crd = pos.coords;

  console.log("Your current position is:");
  console.log(`Latitude : ${crd.latitude}`);
  console.log(`Longitude: ${crd.longitude}`);
  console.log(`More or less ${crd.accuracy} meters.`);
}

function error(err) {
  console.warn(`ERROR(${err.code}): ${err.message}`);
}

navigator.geolocation.getCurrentPosition(success, error, options);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Geolocation API](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- {{domxref("Navigator.geolocation")}}
