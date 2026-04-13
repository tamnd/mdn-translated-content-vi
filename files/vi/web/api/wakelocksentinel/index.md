---
title: WakeLockSentinel
slug: Web/API/WakeLockSentinel
page-type: web-api-interface
browser-compat: api.WakeLockSentinel
---

{{securecontext_header}}{{APIRef("Screen Wake Lock API")}}

Giao diện **`WakeLockSentinel`** của [Screen Wake Lock API](/en-US/docs/Web/API/Screen_Wake_Lock_API) có thể được sử dụng để theo dõi trạng thái của khóa thức màn hình nền tảng và giải phóng khóa thủ công khi cần.

Khóa thức màn hình ngăn màn hình thiết bị bị mờ hoặc khóa khi ứng dụng cần tiếp tục chạy.

Một khóa thức màn hình được yêu cầu bằng phương thức {{domxref('WakeLock.request()','navigator.wakeLock.request()')}}, trả về một {{jsxref('Promise')}} được thực hiện với đối tượng `WakeLockSentinel` nếu khóa được cấp.

Một khóa thức màn hình đã được cấp có thể được giải phóng thủ công qua phương thức {{domxref('WakeLockSentinel.release','release()')}}, hoặc tự động qua khóa thức màn hình nền tảng. Điều sau có thể xảy ra nếu tài liệu trở nên không hoạt động hoặc mất tầm nhìn, nếu thiết bị yếu pin, hoặc nếu người dùng bật chế độ tiết kiệm điện. Một `WakeLockSentinel` đã được giải phóng không thể tái sử dụng: phải yêu cầu một sentinel mới bằng {{domxref('WakeLock.request()','navigator.wakeLock.request()')}} nếu cần khóa mới. Giải phóng tất cả các phiên bản `WakeLockSentinel` của một loại khóa thức nhất định sẽ khiến khóa thức nền tảng cơ sở được giải phóng.

Một sự kiện được kích hoạt tại `WakeLockSentinel` nếu khóa nền tảng được giải phóng, cho phép ứng dụng cấu hình lại UI của mình và yêu cầu lại khóa nếu cần.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref("WakeLockSentinel.released", "released")}} {{ReadOnlyInline}}
  - : Trả về giá trị boolean cho biết liệu `WakeLockSentinel` có đã được giải phóng không.
- {{domxref("WakeLockSentinel.type", "type")}} {{ReadOnlyInline}}
  - : Trả về biểu diễn chuỗi của loại `WakeLockSentinel` hiện đang được giữ. Các giá trị trả về là:
    - `screen`: Khóa thức màn hình. Ngăn thiết bị làm mờ hoặc khóa màn hình.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref('WakeLockSentinel.release()', 'release()')}}
  - : Giải phóng `WakeLockSentinel`, trả về một {{jsxref("Promise")}} được giải quyết sau khi sentinel đã được giải phóng thành công.

## Sự kiện

- {{domxref("WakeLockSentinel.release_event", "release")}}
  - : Được kích hoạt khi phương thức {{domxref('WakeLockSentinel.release','release()')}} được gọi hoặc khóa thức được giải phóng bởi tác nhân người dùng.

## Ví dụ

Trong ví dụ này, chúng ta tạo một hàm bất đồng bộ để yêu cầu `WakeLockSentinel`. Sau khi khóa thức màn hình được cấp, chúng ta lắng nghe sự kiện `release`, có thể được sử dụng để cung cấp phản hồi UI phù hợp. Sentinel có thể được cấp hoặc giải phóng qua các tương tác phù hợp.

```js
// create a reference for the wake lock
let wakeLock = null;

// create an async function to request a wake lock
const requestWakeLock = async () => {
  try {
    wakeLock = await navigator.wakeLock.request("screen");

    // listen for our release event
    wakeLock.addEventListener("release", () => {
      // if wake lock is released alter the UI accordingly
    });
  } catch (err) {
    // if wake lock request fails - usually system related, such as battery
  }
};

wakeLockOnButton.addEventListener("click", () => {
  requestWakeLock();
});

wakeLockOffButton.addEventListener("click", () => {
  if (wakeLock !== null) {
    wakeLock.release().then(() => {
      wakeLock = null;
    });
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Stay awake with the Screen Wake Lock API](https://developer.chrome.com/docs/capabilities/web-apis/wake-lock/)
