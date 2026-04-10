---
title: "Event: thuộc tính returnValue"
short-title: returnValue
slug: Web/API/Event/returnValue
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Event.returnValue
---

{{APIRef("DOM")}}{{Deprecated_Header}}{{AvailableInWorkers}}

Thuộc tính {{domxref("Event")}}
**`returnValue`** cho biết hành động mặc định của sự kiện này
đã bị ngăn hay chưa.

Theo mặc định, nó được đặt thành `true`, cho phép hành động mặc định xảy ra. Việc đặt thuộc tính này thành
`false` sẽ ngăn hành động mặc định.

> [!NOTE]
> Mặc dù `returnValue` đã được đưa vào chuẩn DOM,
> nó chủ yếu tồn tại để hỗ trợ mã hiện có. Hãy dùng
> {{DOMxRef("Event.preventDefault", "preventDefault()")}} và
> {{domxref("Event.defaultPrevented", "defaultPrevented")}} thay vì thuộc tính lịch sử
> này.

## Giá trị

Một giá trị boolean, là `true` nếu sự kiện chưa bị hủy; ngược lại, nếu sự kiện đã bị hủy hoặc hành động mặc định đã bị ngăn, giá trị là `false`.

Giá trị của `returnValue` là nghịch đảo của giá trị được trả về bởi
{{domxref("Event.defaultPrevented", "defaultPrevented")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLDialogElement.returnValue")}}: giá trị trả về của {{HTMLElement("dialog")}}.
