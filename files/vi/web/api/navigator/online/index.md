---
title: "Navigator: thuộc tính onLine"
short-title: onLine
slug: Web/API/Navigator/onLine
page-type: web-api-instance-property
browser-compat: api.Navigator.onLine
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`onLine`** của giao diện {{domxref("Navigator")}} trả về việc thiết bị có được kết nối với mạng hay không, với `true` nghĩa là trực tuyến và `false` nghĩa là ngoại tuyến. Giá trị của thuộc tính thay đổi sau khi trình duyệt kiểm tra kết nối mạng của nó, thường là khi người dùng nhấp vào các liên kết hoặc khi tập lệnh yêu cầu một trang từ xa. Ví dụ: thuộc tính phải trả về `false` khi người dùng nhấp vào liên kết ngay sau khi họ mất kết nối Internet. Khi giá trị của nó thay đổi, sự kiện [`online`](/en-US/docs/Web/API/Window/online_event) hoặc [`offline`](/en-US/docs/Web/API/Window/offline_event) sẽ được kích hoạt trên `window`.

Các trình duyệt và hệ điều hành tận dụng các phương pháp phỏng đoán khác nhau để xác định xem thiết bị có trực tuyến hay không. Nói chung, kết nối tới mạng LAN được coi là trực tuyến, mặc dù mạng LAN có thể không có quyền truy cập Internet. Ví dụ: máy tính có thể đang chạy phần mềm ảo hóa có bộ điều hợp ethernet ảo luôn được "kết nối". Trên Windows, trạng thái trực tuyến được xác định bằng việc liệu nó có thể kết nối với máy chủ gia đình của Microsoft hay không, máy chủ này có thể bị chặn bởi tường lửa hoặc VPN, ngay cả khi máy tính có quyền truy cập Internet. Do đó, thuộc tính này vốn không đáng tin cậy và bạn không nên tắt các tính năng dựa trên trạng thái trực tuyến, chỉ đưa ra gợi ý khi người dùng có vẻ ngoại tuyến.

## Giá trị

Một boolean.

## Ví dụ

### Cách sử dụng cơ bản

Để kiểm tra xem bạn có trực tuyến hay không, hãy truy vấn `window.navigator.onLine`, như trong
ví dụ sau:

```js
if (navigator.onLine) {
  console.log("online");
} else {
  console.log("offline");
}
```

Nếu trình duyệt không hỗ trợ `navigator.onLine` thì ví dụ trên sẽ
luôn xuất hiện dưới dạng `false`/`undefined`.

### Lắng nghe những thay đổi về trạng thái mạng

Để xem những thay đổi về trạng thái mạng, hãy sử dụng
[`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener) tới
lắng nghe các sự kiện trên `window.online` và `window.offline`, như
trong ví dụ sau:

```js
window.addEventListener("offline", (e) => {
  console.log("offline");
});

window.addEventListener("online", (e) => {
  console.log("online");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
