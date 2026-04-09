---
title: "ARIA: thuộc tính aria-valuemin"
short-title: aria-valuemin
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-valuemin
sidebar: accessibilitysidebar
---

Thuộc tính `aria-valuemin` xác định giá trị nhỏ nhất được phép cho một widget dạng range.

## Mô tả

Thuộc tính `aria-valuemin` xác định giá trị nhỏ nhất được phép cho các widget dạng range. Nó tương tự như thuộc tính `min` của {{HTMLElement('progress')}}, {{HTMLElement('meter')}}, và {{HTMLElement('input')}} với kiểu [`range`](/en-US/docs/Web/HTML/Reference/Elements/input/range), [`number`](/en-US/docs/Web/HTML/Reference/Elements/input/number) và tất cả các kiểu ngày giờ.

Khi tạo một vai trò kiểu range, bao gồm [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role), [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role), [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role) và [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role) trên một phần tử không ngữ nghĩa, `aria-valuemin` cho phép xác định một giá trị tối thiểu nhỏ hơn giá trị tối đa và là thuộc tính bắt buộc của `slider`, `scrollbar` và `spinbutton`.

Việc khai báo giá trị tối thiểu và tối đa cho phép công nghệ hỗ trợ truyền đạt kích thước của range cho người dùng.

Giá trị tối đa được xác định bằng [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax).

> [!WARNING]
> Bản thân vai trò [`range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role) **KHÔNG NÊN** được dùng vì đó là một vai trò ["abstract"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles#6._abstract_roles). Thuộc tính `aria-valuemin` được dùng trên tất cả các vai trò con của range.

## Giá trị

- `<number>`
  - : Một số thập phân, thấp hơn giá trị tối đa.

## Giao diện liên quan

- {{domxref("Element.ariaValueMin")}}
  - : Thuộc tính [`ariaValueMin`](/en-US/docs/Web/API/Element/ariaValueMin), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-valuemin`.
- {{domxref("ElementInternals.ariaValueMin")}}
  - : Thuộc tính [`ariaValueMin`](/en-US/docs/Web/API/ElementInternals/ariaValueMin), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-valuemin`.

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
- Thuộc tính `min` của phần tử [`<input type="range>`](/en-US/docs/Web/HTML/Reference/Elements/input/range#min)
- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax)
- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow)
