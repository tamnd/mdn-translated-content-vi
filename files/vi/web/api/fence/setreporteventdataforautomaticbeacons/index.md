---
title: "Fence: setReportEventDataForAutomaticBeacons() method"
short-title: setReportEventDataForAutomaticBeacons()
slug: Web/API/Fence/setReportEventDataForAutomaticBeacons
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Fence.setReportEventDataForAutomaticBeacons
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Phương thức **`setReportEventDataForAutomaticBeacons()`** của giao diện
{{domxref("Fence")}} chỉ định dữ liệu sự kiện sẽ được gửi khi điều hướng xảy ra bên trong {{htmlelement("fencedframe")}}. Dữ liệu này sẽ được gửi qua [beacon](/en-US/docs/Web/API/Beacon_API) tự động đến một hoặc nhiều URL cụ thể được đăng ký thông qua phương thức {{domxref("InterestGroupReportingScriptRunnerGlobalScope.registerAdBeacon", "registerAdBeacon()")}} của [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience), nhằm mục đích thu thập dữ liệu báo cáo cho kết quả đấu giá quảng cáo.

> [!NOTE]
> {{domxref("Fence.reportEvent", "reportEvent()")}} cung cấp việc gửi dữ liệu báo cáo tương tự, ngoại trừ trong trường hợp đó việc gửi được kích hoạt thông qua lệnh gọi phương thức rõ ràng thay vì điều hướng.

## Cú pháp

```js-nolint
setReportEventDataForAutomaticBeacons(event)
```

### Tham số

- `event`
  - : Đối tượng đại diện cho dữ liệu cần gửi. Các thuộc tính có thể có như sau:
    - `eventType`
      - : Chuỗi đại diện cho loại sự kiện đang được báo cáo. Các giá trị khả dụng là:
        - `reserved.top_navigation_start`: Sự kiện được kích hoạt khi điều hướng cấp cao nhất bắt đầu.
        - `reserved.top_navigation_commit`: Sự kiện được kích hoạt khi điều hướng cấp cao nhất hoàn tất.
    - `eventData`
      - : Chuỗi đại diện cho dữ liệu cần gửi.
    - `destination`
      - : Mảng chứa một hoặc nhiều giá trị liệt kê đại diện cho các loại đích. Đây là các bên liên quan sẽ nhận dữ liệu đến URL đã đăng ký của họ (thông qua {{domxref("InterestGroupReportingScriptRunnerGlobalScope.registerAdBeacon", "registerAdBeacon()")}}). Các giá trị có thể là:
        - `"buyer"`: Người đặt giá trong cuộc đấu giá quảng cáo.
        - `"seller"`: Người bán cấp cao nhất điều hành cuộc đấu giá quảng cáo.
        - `"component-seller"`: Người bán cho cuộc đấu giá thành phần trong cuộc đấu giá nhiều cấp.
        - `"direct-seller"`: Người bán đã trực tiếp điều hành cuộc đấu giá mà người mua đã đặt giá. Nếu quảng cáo là cuộc đấu giá một cấp, giá trị được sử dụng sẽ là `"seller"`. Nếu là cuộc đấu giá nhiều cấp, giá trị được sử dụng sẽ là `"component-seller"`.
        - `"shared-storage-select-url"`: Vị trí lưu trữ [Shared Storage API](https://privacysandbox.google.com/private-advertising/shared-storage), được xác định trong lệnh gọi phương thức {{domxref("WindowSharedStorage.selectURL", "Window.sharedStorage.selectURL()")}}.
    - `once` {{optional_inline}}
      - : Giá trị boolean. Nếu đặt là `true`, beacon tự động chỉ được gửi cho sự kiện tiếp theo, và các beacon sẽ không được gửi cho các sự kiện tiếp theo cho đến khi `setReportEventDataForAutomaticBeacons()` được gọi lại. Ví dụ, khi được sử dụng với trình xử lý `click`, điều này có thể được dùng để chỉ gửi dữ liệu beacon cho các điều hướng cấp cao nhất cụ thể, thay vì cho mọi điều hướng cấp cao nhất. Thuộc tính này mặc định là `false`.

### Giá trị trả về

Không có (`Undefined`).

## Ví dụ

```js
window.fence.setReportEventDataForAutomaticBeacons({
  eventType: "reserved.top_navigation_start",
  eventData: "an example string",
  destination: ["seller", "buyer"],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
