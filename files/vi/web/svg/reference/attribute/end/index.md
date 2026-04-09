---
title: end
slug: Web/SVG/Reference/Attribute/end
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#EndAttribute
sidebar: svgref
---

Thuộc tính **`end`** định nghĩa một giá trị kết thúc cho hoạt ảnh có thể giới hạn thời lượng hoạt động.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("set")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;end-value-list></code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

`<end-value-list>` là một danh sách các giá trị được phân tách bằng dấu chấm phẩy. Mỗi giá trị có thể là một trong các giá trị sau:

- `<offset-value>`
  - : Giá trị này định nghĩa một [clock-value](/en-US/docs/Web/SVG/Guides/Content_type#clock-value) đại diện cho một thời điểm tương đối so với thời điểm bắt đầu tài liệu SVG (thường là sự kiện {{domxref("SVGElement/load_event", "load")}} hoặc {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}}). Giá trị âm là hợp lệ.
- `<syncbase-value>`
  - : Giá trị này định nghĩa một _syncbase_ và một độ lệch tùy chọn so với _syncbase_ đó. Thời điểm kết thúc hoạt ảnh của phần tử được định nghĩa tương đối với begin hoặc active end của một hoạt ảnh khác.

    Một syncbase-value hợp lệ gồm một tham chiếu ID tới một phần tử hoạt ảnh khác, tiếp theo là dấu chấm và `begin` hoặc `end` để xác định việc đồng bộ với thời điểm bắt đầu hay active end của phần tử hoạt ảnh được tham chiếu. Có thể thêm một giá trị độ lệch tùy chọn như được định nghĩa trong `<offset-value>`.

- `<event-value>`
  - : Giá trị này định nghĩa một sự kiện và một độ lệch tùy chọn xác định thời điểm hoạt ảnh của phần tử nên kết thúc. Thời điểm kết thúc hoạt ảnh được định nghĩa tương đối với thời điểm sự kiện được chỉ định được kích hoạt.

    Một event-value hợp lệ gồm ID của phần tử, theo sau là dấu chấm và một trong các sự kiện được hỗ trợ cho phần tử đó. Tất cả các sự kiện hợp lệ (không nhất thiết được mọi phần tử hỗ trợ) được định nghĩa bởi đặc tả DOM và HTML. Đó là:
    - {{domxref("Element/focus_event", "focus")}}
    - {{domxref("Element/blur_event", "blur")}}
    - {{domxref("Element/focusin_event", "focusin")}}
    - {{domxref("Element/focusout_event", "focusout")}}
    - {{domxref("Element/DOMActivate_event", "activate")}}
    - {{domxref("Element/auxclick_event", "auxclick")}}
    - {{domxref("Element/click_event", "click")}}
    - {{domxref("Element/dblclick_event", "dblclick")}}
    - {{domxref("Element/mousedown_event", "mousedown")}}
    - {{domxref("Element/mouseenter_event", "mouseenter")}}
    - {{domxref("Element/mouseleave_event", "mouseleave")}}
    - {{domxref("Element/mousemove_event", "mousemove")}}
    - {{domxref("Element/mouseout_event", "mouseout")}}
    - {{domxref("Element/mouseover_event", "mouseover")}}
    - {{domxref("Element/mouseup_event", "mouseup")}}
    - {{domxref("Element/wheel_event", "wheel")}}
    - {{domxref("Element/beforeinput_event", "beforeinput")}}
    - {{domxref("Element/input_event", "input")}}
    - {{domxref("Element/keydown_event", "keydown")}}
    - {{domxref("Element/keyup_event", "keyup")}}
    - {{domxref("Element/compositionstart_event", "compositionstart")}}
    - {{domxref("Element/compositionupdate_event", "compositionupdate")}}
    - {{domxref("Element/compositionend_event", "compositionend")}}
    - {{domxref("SVGElement/load_event", "load")}}
    - {{domxref("SVGElement/unload_event", "unload")}}
    - {{domxref("SVGElement/abort_event", "abort")}}
    - {{domxref("HTMLElement/error_event", "error")}}
    - {{domxref("HTMLInputElement/select_event", "select")}}
    - {{domxref("Window/resize_event", "resize")}}
    - {{domxref("Element/scroll_event", "scroll")}}
    - {{domxref("SVGAnimationElement/beginEvent_event", "beginEvent")}}
    - {{domxref("SVGAnimationElement/endEvent_event", "endEvent")}}
    - {{domxref("SVGAnimationElement/repeatEvent_event", "repeatEvent")}}

    Có thể thêm một giá trị độ lệch tùy chọn như được định nghĩa trong `<offset-value>`.

- `<repeat-value>`
  - : Giá trị này định nghĩa một sự kiện lặp có gắn điều kiện. Thời điểm kết thúc hoạt ảnh của phần tử được định nghĩa tương đối với thời điểm sự kiện lặp được kích hoạt cùng giá trị lặp được chỉ định.

    Một repeat value hợp lệ gồm ID của phần tử, theo sau là dấu chấm và hàm `repeat()` với một giá trị số nguyên chỉ số lần lặp làm tham số. Có thể thêm một giá trị độ lệch tùy chọn như được định nghĩa trong `<offset-value>`.

- `<accessKey-value>`
  - : Giá trị này định nghĩa một phím truy cập sẽ kích hoạt kết thúc hoạt ảnh. Hoạt ảnh của phần tử sẽ kết thúc khi người dùng nhấn phím đã chỉ định.

    Một accessKey-value hợp lệ gồm hàm `accessKey()` với ký tự cần nhập làm tham số. Có thể thêm một giá trị độ lệch tùy chọn như được định nghĩa trong `<offset-value>`.

- `<wallclock-sync-value>`
  - : Giá trị này định nghĩa thời điểm kết thúc hoạt ảnh như một thời điểm đồng hồ thực.

    Một wallclock-sync-value hợp lệ gồm hàm `wallclock()` với một giá trị thời gian làm tham số. Cú pháp thời gian dựa trên cú pháp được định nghĩa trong [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html).

- `indefinite`
  - : Kết thúc hoạt ảnh sẽ được xác định bởi một lời gọi phương thức {{domxref("SVGAnimationElement.endElement()")}}.

## Ví dụ

### Ví dụ offset

```html
<svg
  width="120"
  height="120"
  viewBox="0 0 120 120"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1">
  <!-- animated rectangles -->
  <rect x="10" y="35" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      to="100"
      begin="0s"
      end="8s"
      fill="freeze" />
  </rect>

  <rect x="10" y="60" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      to="75"
      begin="0s"
      end="6s"
      fill="freeze" />
  </rect>

  <rect x="10" y="85" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      to="50"
      begin="0s"
      end="4s"
      fill="freeze" />
  </rect>

  <!-- grid -->
  <text x="10" y="20" text-anchor="middle">0s</text>
  <line x1="10" y1="25" x2="10" y2="105" stroke="grey" stroke-width=".5" />
  <text x="35" y="20" text-anchor="middle">2s</text>
  <line x1="35" y1="25" x2="35" y2="105" stroke="grey" stroke-width=".5" />
  <text x="60" y="20" text-anchor="middle">4s</text>
  <line x1="60" y1="25" x2="60" y2="105" stroke="grey" stroke-width=".5" />
  <text x="85" y="20" text-anchor="middle">6s</text>
  <line x1="85" y1="25" x2="85" y2="105" stroke="grey" stroke-width=".5" />
  <text x="110" y="20" text-anchor="middle">8s</text>
  <line x1="110" y1="25" x2="110" y2="105" stroke="grey" stroke-width=".5" />

  <line x1="10" y1="30" x2="110" y2="30" stroke="grey" stroke-width=".5" />
  <line x1="10" y1="105" x2="110" y2="105" stroke="grey" stroke-width=".5" />
</svg>
```

{{EmbedLiveSample('Offset_example', '100%', 130)}}

### Ví dụ sự kiện

```html
<svg
  width="120"
  height="120"
  viewBox="0 0 120 120"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <!-- animated rectangle -->
  <rect x="10" y="35" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      from="0"
      to="100"
      begin="0s"
      end="endButton.click"
      dur="8s"
      repeatCount="indefinite"
      fill="freeze" />
  </rect>

  <!-- trigger -->
  <rect
    id="endButton"
    cursor="pointer"
    x="19.5"
    y="62.5"
    rx="5"
    height="25"
    width="80"
    fill="#EFEFEF"
    stroke="black"
    stroke-width="1" />

  <text x="60" y="80" text-anchor="middle" pointer-events="none">
    Click me.
  </text>

  <!-- grid -->
  <text x="10" y="20" text-anchor="middle">0s</text>
  <line x1="10" y1="25" x2="10" y2="55" stroke="grey" stroke-width=".5" />
  <text x="35" y="20" text-anchor="middle">2s</text>
  <line x1="35" y1="25" x2="35" y2="55" stroke="grey" stroke-width=".5" />
  <text x="60" y="20" text-anchor="middle">4s</text>
  <line x1="60" y1="25" x2="60" y2="55" stroke="grey" stroke-width=".5" />
  <text x="85" y="20" text-anchor="middle">6s</text>
  <line x1="85" y1="25" x2="85" y2="55" stroke="grey" stroke-width=".5" />
  <text x="110" y="20" text-anchor="middle">8s</text>
  <line x1="110" y1="25" x2="110" y2="55" stroke="grey" stroke-width=".5" />

  <line x1="10" y1="30" x2="110" y2="30" stroke="grey" stroke-width=".5" />
  <line x1="10" y1="55" x2="110" y2="55" stroke="grey" stroke-width=".5" />
</svg>
```
