---
title: Fence
slug: Web/API/Fence
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Fence
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Giao diện **`Fence`** của {{domxref("Fenced Frame API", "Fenced Frame API", "", "nocode")}} chứa một số hàm liên quan đến chức năng {{htmlelement("fencedframe")}}.

Các đối tượng `Fence` được truy cập thông qua thuộc tính {{domxref("Window.fence")}}, nhưng chúng chỉ khả dụng cho các tài liệu được nhúng bên trong {{htmlelement("fencedframe")}} (được tải thông qua {{domxref("FencedFrameConfig")}}) hoặc {{htmlelement("iframe")}} (được tải thông qua URI không rõ ràng).

> [!NOTE]
> Xem [Cách `<fencedframe>` hoạt động?](/en-US/docs/Web/API/Fenced_frame_API#how_do_fencedframes_work) để biết mô tả về `FencedFrameConfig` và URI không rõ ràng.

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("Fence.getNestedConfigs", "getNestedConfigs()")}} {{Experimental_Inline}}
  - : Trả về các {{domxref("FencedFrameConfig")}} được tải vào các `<fencedframe>` nhúng bên trong `<fencedframe>` hiện tại.
- {{domxref("Fence.reportEvent", "reportEvent()")}} {{Experimental_Inline}}
  - : Kích hoạt việc gửi dữ liệu báo cáo thông qua [beacon](/en-US/docs/Web/API/Beacon_API) đến một hoặc nhiều URL cụ thể được đăng ký thông qua phương thức {{domxref("InterestGroupReportingScriptRunnerGlobalScope.registerAdBeacon", "registerAdBeacon()")}} của [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience), nhằm mục đích thu thập kết quả đấu giá quảng cáo.
- {{domxref("Fence.setReportEventDataForAutomaticBeacons", "setReportEventDataForAutomaticBeacons()")}} {{Experimental_Inline}}
  - : Chỉ định dữ liệu sự kiện sẽ được gửi khi điều hướng xảy ra bên trong `<fencedframe>`. Dữ liệu này sẽ được gửi qua beacon tự động đến một hoặc nhiều URL cụ thể được đăng ký thông qua phương thức {{domxref("InterestGroupReportingScriptRunnerGlobalScope.registerAdBeacon", "registerAdBeacon()")}} của [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience), nhằm mục đích thu thập dữ liệu báo cáo cho kết quả đấu giá quảng cáo.

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
