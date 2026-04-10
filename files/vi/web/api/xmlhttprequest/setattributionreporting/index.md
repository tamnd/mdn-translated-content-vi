---
title: "XMLHttpRequest: phương thức setAttributionReporting()"
short-title: setAttributionReporting()
slug: Web/API/XMLHttpRequest/setAttributionReporting
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.XMLHttpRequest.setAttributionReporting
---

{{APIRef("Attribution Reporting API")}}{{securecontext_header}}{{deprecated_header}}

Phương thức **`setAttributionReporting()`** của giao diện {{domxref("XMLHttpRequest")}} cho biết bạn muốn phản hồi của yêu cầu có thể đăng ký một [nguồn phân thuộc tính](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#javascript-based_event_sources) hoặc [trình kích hoạt phân thuộc tính](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers#javascript-based_attribution_triggers) dựa trên JavaScript.

Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

## Cú pháp

```js-nolint
setAttributionReporting(options)
```

### Tham số

- `options`
  - : Một đối tượng cung cấp các tùy chọn báo cáo phân thuộc tính, bao gồm các thuộc tính sau:
    - `eventSourceEligible`
      - : Một boolean. Nếu đặt thành `true`, phản hồi của yêu cầu đủ điều kiện đăng ký nguồn phân thuộc tính. Nếu đặt thành `false`, nó không đủ điều kiện.
    - `triggerEligible`
      - : Một boolean. Nếu đặt thành `true`, phản hồi của yêu cầu đủ điều kiện đăng ký trình kích hoạt phân thuộc tính. Nếu đặt thành `false`, nó không đủ điều kiện.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("XMLHttpRequest")}} liên kết chưa được {{domxref("XMLHttpRequest.open", "mở", "", "nocode")}}, hoặc đã được {{domxref("XMLHttpRequest.send", "gửi", "", "nocode")}}.
- `TypeError` {{domxref("DOMException")}}
  - : Được ném nếu việc sử dụng [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) bị chặn bởi {{httpheader("Permissions-Policy")}} [`attribution-reporting`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/attribution-reporting).

## Ví dụ

```js
const attributionReporting = {
  eventSourceEligible: true,
  triggerEligible: false,
};

function triggerSourceInteraction() {
  const req = new XMLHttpRequest();
  req.open("GET", "https://shop.example/endpoint");
  // Kiểm tra tính khả dụng của setAttributionReporting() trước khi gọi
  if (typeof req.setAttributionReporting === "function") {
    req.setAttributionReporting(attributionReporting);
    req.send();
  } else {
    throw new Error("Attribution reporting not available");
    // Bao gồm mã khôi phục tại đây nếu phù hợp
  }
}

// Liên kết trình kích hoạt tương tác với bất kỳ phần tử và sự kiện nào phù hợp với mã của bạn
elem.addEventListener("click", triggerSourceInteraction);
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API)
