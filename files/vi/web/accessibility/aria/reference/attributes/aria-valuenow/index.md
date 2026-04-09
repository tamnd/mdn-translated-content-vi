---
title: "ARIA: thuộc tính aria-valuenow"
short-title: aria-valuenow
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-valuenow
sidebar: accessibilitysidebar
---

Thuộc tính `aria-valuenow` xác định giá trị hiện tại cho một widget `range`.

## Mô tả

Thuộc tính `aria-valuenow` xác định giá trị hiện tại cho các widget dạng range. Nó tương tự như thuộc tính `value` của {{HTMLElement('progress')}}, {{HTMLElement('meter')}}, và {{HTMLElement('input')}} với kiểu [`range`](/en-US/docs/Web/HTML/Reference/Elements/input/range), [`number`](/en-US/docs/Web/HTML/Reference/Elements/input/number) và tất cả các kiểu ngày giờ.

Khi tạo một vai trò kiểu range, bao gồm [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role), [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role), [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role) và [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role) trên một phần tử không ngữ nghĩa, `aria-valuenow` cho phép xác định một giá trị số hiện tại nằm giữa giá trị tối thiểu và tối đa. Giá trị tối thiểu và tối đa được xác định bằng [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin) và [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax).

> [!WARNING]
> Bản thân vai trò [`range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role) **KHÔNG NÊN** được dùng vì đó là một vai trò ["abstract"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#6._abstract_roles). Thuộc tính `aria-valuenow` được dùng trên tất cả các vai trò con của range.

```html
<p id="birthyearLabel">What year were you born?</p>
<div
  role="spinbutton"
  tabindex="-1"
  aria-valuenow="1984"
  aria-valuemin="1900"
  aria-valuemax="2021"
  aria-labelledby="birthyearLabel">
  <span class="value"> 1984 </span>
  <span role="button">
    <span aria-hidden="true">+</span>
    Increment year by 1
  </span>
  <span role="button">
    <span aria-hidden="true">-</span>
    Decrement year by 1
  </span>
</div>
```

Khi có thể, hãy dùng các phần tử HTML ngữ nghĩa:

```html
<label for="birthyear">What year were you born?</label>
<input type="number" id="birthyear" value="1984" min="1900" max="2021" />
```

Nếu không có giá trị đã biết, như khi thanh tiến trình ở trạng thái không xác định, đừng đặt thuộc tính `aria-valuenow`.

Khi không có `aria-valuenow`, không có thông tin nào được suy ra về giá trị hiện tại.

Khi dùng với sliders và spinbuttons, công nghệ hỗ trợ sẽ thông báo giá trị thực cho người dùng.

Khi dùng với progressbar và scrollbar, công nghệ hỗ trợ sẽ thông báo giá trị cho người dùng dưới dạng phần trăm. Khi cả `aria-valuemin` và `aria-valuemax` đều được xác định, giá trị phần trăm được tính như vị trí trên dải giá trị. Nếu không, giá trị thực sẽ được thông báo dưới dạng phần trăm.

Khi giá trị cần thông báo, dù là giá trị thực hay giá trị phần trăm, có thể không rõ ràng với người dùng, thuộc tính [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext) nên được dùng để cung cấp một biểu diễn thân thiện hơn. Khi được đặt, chuỗi valuetext sẽ được đọc thay cho giá trị số của valuenow. Ví dụ, nếu một slider biểu thị các ngày trong tuần, và `aria-valuenow` của ngày là một con số, thì thuộc tính `aria-valuetext` nên được đặt thành một chuỗi dễ hiểu giá trị slider, chẳng hạn "Monday".

## Ví dụ

```html
<p id="temperatureLabel">Oven Temperature</p>
<div
  role="meter"
  id="temperature"
  aria-valuenow="205"
  aria-valuemin="70"
  aria-valuemax="250"
  aria-labelledby="temperatureLabel">
  <div class="meter-color" aria-hidden="true"></div>
</div>
```

Quy tắc đầu tiên khi dùng ARIA là: "nếu bạn có thể dùng một tính năng gốc đã có sẵn ngữ nghĩa và hành vi mà bạn cần, thay vì tái sử dụng một phần tử rồi **thêm** vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có trợ năng, thì hãy làm như vậy."

```html
<label for="temperature">Oven Temperature</label>
<input type="range" id="temperature" value="205" min="70" max="250" step="5" />
```

Nếu chúng ta dùng ngữ nghĩa HTML gốc với {{HTMLElement('input')}}, chúng ta sẽ có kiểu và ngữ nghĩa sẵn có.

## Giá trị

- `<number>`
  - : Một số thập phân, nằm giữa giá trị tối thiểu và tối đa.

## Giao diện liên quan

- {{domxref("Element.ariaValueNow")}}
  - : Thuộc tính [`ariaValueNow`](/en-US/docs/Web/API/Element/ariaValueNow), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-valuenow`.
- {{domxref("ElementInternals.ariaValueNow")}}
  - : Thuộc tính [`ariaValueNow`](/en-US/docs/Web/API/ElementInternals/ariaValueNow), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-valuenow`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role)
- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)

Kế thừa vào các vai trò:

- [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role)
- [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role)
- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Vai trò [`range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role)
- Thuộc tính `value` của phần tử [`<input type="range>`](/en-US/docs/Web/HTML/Reference/Elements/input/range#value)
- [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext)
- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax)
- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin).
