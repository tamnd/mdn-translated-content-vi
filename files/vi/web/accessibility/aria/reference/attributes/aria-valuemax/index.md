---
title: "ARIA: thuộc tính aria-valuemax"
short-title: aria-valuemax
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-valuemax
sidebar: accessibilitysidebar
---

Thuộc tính `aria-valuemax` xác định giá trị lớn nhất được phép cho một widget dạng range.

## Mô tả

Thuộc tính `aria-valuemax` xác định giá trị lớn nhất được phép cho các widget dạng range. Nó tương tự như thuộc tính `max` của {{HTMLElement('progress')}}, {{HTMLElement('meter')}}, và {{HTMLElement('input')}} với kiểu [`range`](/en-US/docs/Web/HTML/Reference/Elements/input/range), [`number`](/en-US/docs/Web/HTML/Reference/Elements/input/number) và tất cả các kiểu ngày giờ.

Khi tạo một vai trò kiểu range, bao gồm [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role), [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role), [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role) và [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role) trên một phần tử không ngữ nghĩa, `aria-valuemax` cho phép xác định giá trị lớn nhất lớn hơn giá trị tối thiểu và là thuộc tính bắt buộc của `slider`, `scrollbar` và `spinbutton`.

Việc khai báo giá trị tối thiểu và tối đa cho phép công nghệ hỗ trợ truyền đạt kích thước của range cho người dùng. Giá trị tối thiểu được xác định bằng [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin).

> [!WARNING]
> Bản thân vai trò [`range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role) **KHÔNG NÊN** được dùng vì đó là một vai trò ["abstract"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#6._abstract_roles). Thuộc tính `aria-valuemax` được dùng trên tất cả các vai trò con của range.

## Ví dụ

Đoạn mã dưới đây cho thấy một slider có giá trị tối đa là 9.

```html
<div id="dimesLabel">Dimes</div>
<div
  role="slider"
  aria-valuenow="0"
  aria-valuemin="0"
  aria-valuemax="9"
  aria-labelledby="dimesLabel"
  id="dimes"></div>
```

## Giá trị

- `<number>`
  - : Một số nguyên hoặc số thập phân lớn hơn giá trị tối thiểu.

## Giao diện liên quan

- {{domxref("Element.ariaValueMax")}}
  - : Thuộc tính [`ariaValueMax`](/en-US/docs/Web/API/Element/ariaValueMax), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-valuemax`.
- {{domxref("ElementInternals.ariaValueMax")}}
  - : Thuộc tính [`ariaValueMax`](/en-US/docs/Web/API/ElementInternals/ariaValueMax), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-valuemax`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role)
- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role) (bắt buộc)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role) (bắt buộc)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role) (bắt buộc)

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
- Thuộc tính `max` của phần tử [`<input type="range>`](/en-US/docs/Web/HTML/Reference/Elements/input/range#max)
- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin)
- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow)
