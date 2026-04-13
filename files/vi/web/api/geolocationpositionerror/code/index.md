---
title: "GeolocationPositionError: code property"
short-title: code
slug: Web/API/GeolocationPositionError/code
page-type: web-api-instance-property
browser-compat: api.GeolocationPositionError.code
---

{{securecontext_header}}{{APIRef("Geolocation API")}}

Thuộc tính chỉ đọc **`code`** của giao diện {{domxref("GeolocationPositionError")}} là `unsigned short` đại diện cho mã lỗi.

Các giá trị có thể bao gồm:

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Giá trị</th>
      <th scope="col">Hằng số liên quan</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>1</code></td>
      <td><code>PERMISSION_DENIED</code></td>
      <td>
        Việc thu thập thông tin vị trí địa lý thất bại do trang không có quyền thực hiện điều đó.
      </td>
    </tr>
    <tr>
      <td><code>2</code></td>
      <td><code>POSITION_UNAVAILABLE</code></td>
      <td>
        Việc thu thập vị trí địa lý thất bại do một hoặc một số nguồn nội bộ của vị trí trả về lỗi nội bộ.
      </td>
    </tr>
    <tr>
      <td><code>3</code></td>
      <td><code>TIMEOUT</code></td>
      <td>Thông tin vị trí địa lý không được lấy trong thời gian cho phép.</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng định vị địa lý](/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API)
- {{domxref("GeolocationPositionError")}}
