---
title: begin
slug: Web/SVG/Reference/Attribute/begin
page-type: svg-attribute
spec-urls: https://svgwg.org/specs/animations/#BeginAttribute
sidebar: svgref
---

Thuộc tính **`begin`** xác định thời điểm phần tử liên quan trở nên hoạt động.
Đối với một phần tử hoạt ảnh, đây là điểm mà hoạt ảnh nên bắt đầu.

Giá trị thuộc tính là một danh sách các giá trị được phân tách bằng dấu chấm phẩy. Cách diễn giải danh sách các thời điểm bắt đầu được mô tả chi tiết trong đặc tả SMIL ở mục ["Evaluation of begin and end time lists"](https://www.w3.org/TR/smil-animation/#Timing-EvaluationOfBeginEndTimeLists). Mỗi giá trị riêng lẻ có thể là một trong các giá trị sau: `<offset-value>`, `<syncbase-value>`, `<event-value>`, `<repeat-value>`, `<accessKey-value>`, `<wallclock-sync-value>` hoặc keyword `indefinite`.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("set")}}

## animate, animateMotion, animateTransform, set

Với {{SVGElement("animate")}}, {{SVGElement("animateMotion")}}, {{SVGElement("animateTransform")}}, và {{SVGElement("set")}}, `begin` xác định khi nào phần tử nên bắt đầu, tức là trở nên hoạt động.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;begin-value-list></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0s</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

`<begin-value-list>` là một danh sách các giá trị được phân tách bằng dấu chấm phẩy. Mỗi giá trị có thể là một trong các giá trị sau:

- `<offset-value>`
  - : Giá trị này xác định một [clock-value](/en-US/docs/Web/SVG/Guides/Content_type#clock-value) biểu thị một thời điểm tương đối so với đầu tài liệu SVG (thường là sự kiện {{domxref("Window/load_event", "load")}} hoặc {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}}). Giá trị âm là hợp lệ.
- `<syncbase-value>`
  - : Giá trị này xác định một _syncbase_ và một độ lệch tùy chọn từ _syncbase_ đó. Thời điểm bắt đầu hoạt ảnh của phần tử được xác định tương đối với begin hoặc active end của một hoạt ảnh khác.

    Một syncbase-value hợp lệ gồm một tham chiếu ID tới một phần tử hoạt ảnh khác, theo sau là dấu chấm và `begin` hoặc `end` để xác định có đồng bộ với phần bắt đầu hay phần kết thúc hoạt động của phần tử hoạt ảnh được tham chiếu hay không. Có thể thêm một giá trị độ lệch tùy chọn như được định nghĩa trong `<offset-value>`.

- `<event-value>`
  - : Giá trị này xác định một sự kiện và một độ lệch tùy chọn để quyết định thời điểm hoạt ảnh của phần tử nên bắt đầu. Thời điểm bắt đầu hoạt ảnh được xác định tương đối với thời điểm sự kiện được chỉ định được kích hoạt.

    Một event-value hợp lệ gồm một ID phần tử theo sau là dấu chấm và một trong các sự kiện được hỗ trợ cho phần tử đó. Tất cả các sự kiện hợp lệ (không nhất thiết được mọi phần tử hỗ trợ) được định nghĩa bởi đặc tả DOM và HTML. Những sự kiện đó là:
    - {{domxref("Element/focus_event", "focus")}}
    - {{domxref("Element/blur_event", "blur")}}
    - {{domxref("Element/focusin_event", "focusin")}}
    - {{domxref("Element/focusout_event", "focusout")}}
    - {{domxref("Element/DOMActivate_event", "DOMActivate")}}
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
    - {{domxref("Element/wheel_event","wheel")}}
    - {{domxref("Element/beforeinput_event", "beforeinput")}}
    - {{domxref("Element/input_event", "input")}}
    - {{domxref("Element/keydown_event", "keydown")}}
    - {{domxref("Element/keyup_event", "keyup")}}
    - {{domxref("Element/compositionstart_event", "compositionstart")}}
    - {{domxref("Element/compositionupdate_event", "compositionupdate")}}
    - {{domxref("Element/compositionend_event", "compositionend")}}
    - {{domxref("Window/load_event", "load")}}
    - {{domxref("Window/unload_event", "unload")}}
    - {{domxref("HTMLMediaElement/abort_event", "abort")}}
    - {{domxref("HTMLElement/error_event", "error")}}
    - {{domxref("HTMLInputElement/select_event", "select")}}
    - {{domxref("Window/resize_event", "resize")}}
    - {{domxref("Element/scroll_event", "scroll")}}
    - {{domxref("SVGAnimationElement/beginEvent_event", "beginEvent")}}
    - {{domxref("SVGAnimationElement/endEvent_event", "endEvent")}}
    - {{domxref("SVGAnimationElement/repeatEvent_event", "repeatEvent")}}

    Có thể thêm một giá trị độ lệch tùy chọn như được định nghĩa trong `<offset-value>`.

- `<repeat-value>`
  - : Giá trị này xác định một sự kiện lặp có định danh. Thời điểm bắt đầu hoạt ảnh của phần tử được xác định tương đối với thời điểm sự kiện lặp được kích hoạt với giá trị vòng lặp được chỉ định.

    Một repeat value hợp lệ gồm một ID phần tử theo sau là dấu chấm và hàm `repeat()` với một giá trị số nguyên chỉ số lần lặp làm tham số. Có thể thêm một giá trị độ lệch tùy chọn như được định nghĩa trong `<offset-value>`.

- `<accessKey-value>`
  - : Giá trị này xác định một phím truy cập sẽ kích hoạt hoạt ảnh. Hoạt ảnh của phần tử sẽ bắt đầu khi người dùng nhấn phím được chỉ định.

    Một accessKey-value hợp lệ gồm hàm `accessKey()` với ký tự cần nhập làm tham số. Có thể thêm một giá trị độ lệch tùy chọn như được định nghĩa trong `<offset-value>`.

- `<wallclock-sync-value>`
  - : Giá trị này xác định thời điểm bắt đầu hoạt ảnh là một thời gian đồng hồ thực.

    Một wallclock-sync-value hợp lệ gồm hàm `wallclock()` với một giá trị thời gian làm tham số. Cú pháp thời gian dựa trên cú pháp được định nghĩa trong [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html).

- `indefinite`
  - : Phần bắt đầu của hoạt ảnh sẽ được xác định bởi một lời gọi phương thức `beginElement()` hoặc một siêu liên kết nhắm tới phần tử đó.

## Ví dụ

### Ví dụ độ lệch

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
      dur="8s"
      fill="freeze" />
  </rect>

  <rect x="35" y="60" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      to="75"
      begin="2s"
      dur="6s"
      fill="freeze" />
  </rect>

  <rect x="60" y="85" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      to="50"
      begin="4s"
      dur="4s"
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

### Ví dụ syncbase

```html
<svg
  width="120"
  height="120"
  viewBox="0 0 120 120"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <!-- animated rectangles -->
  <rect x="10" y="35" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      to="50"
      id="first"
      begin="0s;third.end"
      dur="4s" />
  </rect>

  <rect x="60" y="60" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      to="25"
      id="second"
      begin="first.end"
      dur="2s" />
  </rect>

  <rect x="35" y="85" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      to="75"
      id="third"
      begin="second.end"
      dur="2s" />
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

{{EmbedLiveSample('Syncbase_example', '100%', 130)}}

### Ví dụ sự kiện

```html
<svg
  width="120"
  height="120"
  viewBox="0 0 120 120"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1">
  <!-- animated rectangle -->
  <rect x="10" y="35" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      from="0"
      to="100"
      begin="startButton.click"
      dur="8s"
      fill="freeze" />
  </rect>

  <rect x="60" y="15" rx="5" ry="5" width="30" height="20" fill="blue" id="startButton">
    <set attributeName="fill" to="red" begin="startButton.click" end="startButton.mouseup" />
  </rect>
  <text x="75" y="30" font-size="10" text-anchor="middle" pointer-events="none">
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

{{EmbedLiveSample('Event_example', '100%', 130)}}

### Ví dụ lặp

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
      id="myLoop"
      begin="0s;myLoop.end"
      dur="4s"
      repeatCount="3" />

    <set
      attributeType="CSS"
      attributeName="fill"
      to="green"
      begin="myLoop.begin" />

    <set
      attributeType="CSS"
      attributeName="fill"
      to="gold"
      begin="myLoop.repeat(1)" />

    <set
      attributeType="CSS"
      attributeName="fill"
      to="red"
      begin="myLoop.repeat(2)" />
  </rect>

  <!-- grid -->
  <text x="10" y="20" text-anchor="middle">0s</text>
  <line x1="10" y1="25" x2="10" y2="55" stroke="grey" stroke-width=".5" />
  <text x="35" y="20" text-anchor="middle">1s</text>
  <line x1="35" y1="25" x2="35" y2="55" stroke="grey" stroke-width=".5" />
  <text x="60" y="20" text-anchor="middle">2s</text>
  <line x1="60" y1="25" x2="60" y2="55" stroke="grey" stroke-width=".5" />
  <text x="85" y="20" text-anchor="middle">3s</text>
  <line x1="85" y1="25" x2="85" y2="55" stroke="grey" stroke-width=".5" />
  <text x="110" y="20" text-anchor="middle">4s</text>
  <line x1="110" y1="25" x2="110" y2="55" stroke="grey" stroke-width=".5" />

  <line x1="10" y1="30" x2="110" y2="30" stroke="grey" stroke-width=".5" />
  <line x1="10" y1="55" x2="110" y2="55" stroke="grey" stroke-width=".5" />
</svg>
```

{{EmbedLiveSample('Repeat_example', '100%', 130)}}

### Ví dụ accesskey

```html
<svg
  width="120"
  height="120"
  viewBox="0 0 120 120"
  xmlns="http://www.w3.org/2000/svg"
  version="1.1"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <!-- animated rectangles -->
  <rect x="10" y="35" height="15" width="0">
    <animate
      attributeType="XML"
      attributeName="width"
      from="0"
      to="100"
      begin="accessKey(s)"
      dur="8s"
      fill="freeze" />
  </rect>

  <!-- trigger -->
  <text x="60" y="80" text-anchor="middle" pointer-events="none">
    Hit the "s" key
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

{{EmbedLiveSample('Accesskey_example', '100%', 130)}}

_Ví dụ này được nhúng trong một iFrame. Nếu bạn muốn kích hoạt các sự kiện phím, bạn phải nhấp vào nó trước._

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [SVG animation with SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
