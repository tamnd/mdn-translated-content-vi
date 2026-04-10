---
title: "Event: thuộc tính explicitOriginalTarget"
short-title: explicitOriginalTarget
slug: Web/API/Event/explicitOriginalTarget
page-type: web-api-instance-property
status:
  - non-standard
browser-compat: api.Event.explicitOriginalTarget
---

{{APIRef("DOM")}}{{Non-standard_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`explicitOriginalTarget`** của giao diện {{domxref("Event")}} trả về đích gốc không-ẩn danh của sự kiện.

Nếu sự kiện đã được retarget vì một lý do nào đó khác với việc đi qua ranh giới ẩn danh, giá trị này sẽ được đặt thành đích trước khi retargeting xảy ra.

Ví dụ, các sự kiện chuột sẽ được retarget tới nút cha của chúng khi chúng xảy ra trên các nút văn bản (xem [Firefox bug 185889](https://bugzil.la/185889)), và trong trường hợp đó [`currentTarget`](/en-US/docs/Web/API/Event/currentTarget) sẽ hiển thị nút cha, còn thuộc tính này sẽ hiển thị nút văn bản.

Thuộc tính này cũng khác với [`originalTarget`](/en-US/docs/Web/API/Event/originalTarget) ở chỗ nó sẽ không bao giờ chứa nội dung ẩn danh.

## Giá trị

Trả về đối tượng {{domxref("EventTarget")}}, hoặc `null` nếu không có.

## Ví dụ

Thuộc tính này có thể được dùng với `<command>` để lấy chi tiết sự kiện của đối tượng gốc gọi lệnh.

```js
function myCommand(ev) {
  alert(ev.explicitOriginalTarget.nodeName); // trả về 'menuitem'
}
```

```xml
<xul:command id="my-cmd-anAction" oncommand="myCommand(event);"/>

<xul:menulist>
  <xul:menupopup>
    <xul:menuitem label="Lấy tên phần tử của tôi!" command="my-cmd-anAction"/>
  </xul:menupopup>
</menulist>
```

## Thông số kỹ thuật

_Đây là một thuộc tính chỉ có ở Mozilla và không thuộc bất kỳ đặc tả hiện tại nào. Nó không có khả năng trở thành chuẩn._

## Tương thích trình duyệt

{{Compat}}
