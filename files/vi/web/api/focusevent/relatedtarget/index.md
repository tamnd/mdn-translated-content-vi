---
title: "FocusEvent: Thuộc tính relatedTarget"
short-title: relatedTarget
slug: Web/API/FocusEvent/relatedTarget
page-type: web-api-instance-property
browser-compat: api.FocusEvent.relatedTarget
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`relatedTarget`** của giao diện {{domxref("FocusEvent")}} là mục tiêu phụ, tùy thuộc vào loại sự kiện:

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Tên sự kiện</th>
      <th scope="col"><code>target</code></th>
      <th scope="col"><code>relatedTarget</code></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{{domxref("Element/blur_event", "blur")}}</td>
      <td>{{domxref("EventTarget")} mất focus</td>
      <td>{{domxref("EventTarget")} nhận focus (nếu có).</td>
    </tr>
    <tr>
      <td>{{domxref("Element/focus_event", "focus")}}</td>
      <td>{{domxref("EventTarget")} nhận focus</td>
      <td>{{domxref("EventTarget")} mất focus (nếu có)</td>
    </tr>
    <tr>
      <td>{{domxref("Element/focusin_event", "focusin")}}</td>
      <td>{{domxref("EventTarget")} nhận focus</td>
      <td>{{domxref("EventTarget")} mất focus (nếu có)</td>
    </tr>
    <tr>
      <td>{{domxref("Element/focusout_event", "focusout")}}</td>
      <td>{{domxref("EventTarget")} mất focus</td>
      <td>{{domxref("EventTarget")} nhận focus (nếu có)</td>
    </tr>
  </tbody>
</table>

Lưu ý rằng [nhiều phần tử không thể có focus](https://stackoverflow.com/questions/42764494/blur-event-relatedtarget-returns-null/42764495), đây là lý do phổ biến khiến `relatedTarget` có giá trị `null`. `relatedTarget` cũng có thể được đặt thành `null` vì lý do bảo mật, chẳng hạn như khi tab vào hoặc ra khỏi một trang.

{{domxref("MouseEvent.relatedTarget")}} là một thuộc tính tương tự cho các sự kiện chuột.

## Giá trị

Một instance của {{domxref("EventTarget")}}.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("FocusEvent") }}
