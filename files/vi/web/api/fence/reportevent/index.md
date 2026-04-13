---
title: "Fence: reportEvent() method"
short-title: reportEvent()
slug: Web/API/Fence/reportEvent
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Fence.reportEvent
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Phương thức **`reportEvent()`** của giao diện
{{domxref("Fence")}} kích hoạt việc gửi dữ liệu báo cáo thông qua [beacon](/en-US/docs/Web/API/Beacon_API) đến một hoặc nhiều URL cụ thể được đăng ký thông qua phương thức {{domxref("InterestGroupReportingScriptRunnerGlobalScope.registerAdBeacon", "registerAdBeacon()")}} của [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience), nhằm mục đích thu thập kết quả đấu giá quảng cáo.

> [!NOTE]
> {{domxref("Fence.setReportEventDataForAutomaticBeacons", "setReportEventDataForAutomaticBeacons()")}} cung cấp việc gửi dữ liệu báo cáo tương tự, ngoại trừ trong trường hợp đó việc gửi được kích hoạt qua điều hướng thay vì bằng lệnh gọi phương thức rõ ràng.

## Cú pháp

```js-nolint
reportEvent(event)
```

### Tham số

- `event`
  - : Đối tượng hoặc chuỗi đại diện cho dữ liệu cần gửi.
    - Giá trị đối tượng xác định một sự kiện báo cáo cụ thể mà bạn muốn gửi. Các thuộc tính bắt buộc như sau:
      - `eventType`
        - : Chuỗi đại diện cho loại sự kiện đang được báo cáo, ví dụ bạn có thể quan tâm đến số lần nhấp vào quảng cáo. Chuỗi này có thể là bất kỳ tên sự kiện liên quan nào (ví dụ: [`click`](/en-US/docs/Web/API/Element/click_event)). Chuỗi này cần khớp với loại sự kiện được chỉ định trong lệnh gọi {{domxref("InterestGroupReportingScriptRunnerGlobalScope.registerAdBeacon", "registerAdBeacon()")}} liên quan trong worklet [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience).
      - `eventData`
        - : Chuỗi đại diện cho dữ liệu cần gửi.
      - `destination`
        - : Mảng chứa một hoặc nhiều giá trị liệt kê đại diện cho các loại đích. Đây là các bên liên quan sẽ nhận dữ liệu đến URL đã đăng ký của họ (thông qua {{domxref("InterestGroupReportingScriptRunnerGlobalScope.registerAdBeacon", "registerAdBeacon()")}}). Các giá trị có thể là:
          - `"buyer"`: Người đặt giá trong cuộc đấu giá quảng cáo.
          - `"seller"`: Người bán cấp cao nhất điều hành cuộc đấu giá quảng cáo.
          - `"component-seller"`: Người bán cho cuộc đấu giá thành phần trong cuộc đấu giá nhiều cấp.
          - `"direct-seller"`: Người bán đã trực tiếp điều hành cuộc đấu giá mà người mua đã đặt giá. Nếu quảng cáo là cuộc đấu giá một cấp, giá trị được sử dụng sẽ là `"seller"`. Nếu là cuộc đấu giá nhiều cấp, giá trị được sử dụng sẽ là `"component-seller"`.
          - `"shared-storage-select-url"`: Vị trí lưu trữ [Shared Storage API](https://privacysandbox.google.com/private-advertising/shared-storage), được xác định trong lệnh gọi phương thức {{domxref("WindowSharedStorage.selectURL", "Window.sharedStorage.selectURL()")}}.
    - Giá trị chuỗi đại diện cho `eventType`, ví dụ `"click"` (xem định nghĩa trước đó về `eventType`). Khi một chuỗi `eventType` được truyền làm giá trị của `reportEvent()`, nó kích hoạt tất cả các đóng góp Private Aggregation được thực hiện có điều kiện trên loại sự kiện đó (ví dụ: thông qua {{domxref("PrivateAggregation.contributeToHistogramOnEvent()")}}) để được gửi.

### Giá trị trả về

Không có (`Undefined`).

## Ví dụ

```js
window.fence.reportEvent({
  eventType: "click",
  eventData: JSON.stringify({ clickX: "123", clickY: "456" }),
  destination: ["buyer", "seller"],
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
