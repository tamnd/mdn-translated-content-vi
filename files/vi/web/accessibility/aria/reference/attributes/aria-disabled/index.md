---
title: "ARIA: thuộc tính aria-disabled"
short-title: aria-disabled
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-disabled
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-disabled
sidebar: accessibilitysidebar
---

Trạng thái `aria-disabled` cho biết phần tử có thể được nhận biết nhưng bị vô hiệu hóa, vì vậy nó không thể chỉnh sửa hoặc thực hiện thao tác khác.

## Mô tả

Khi `aria-disabled` được đặt thành `true`, điều đó cho biết phần tử mà nó được đặt lên và tất cả các phần tử con có thể nhận tiêu điểm của nó đều được xem là ở trạng thái bị vô hiệu hóa. Khai báo này sẽ thông báo cho những người dùng công nghệ hỗ trợ, chẳng hạn trình đọc màn hình, rằng những phần tử này không được thiết kế để có thể chỉnh sửa hoặc thao tác được.

Khác với thuộc tính Boolean [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/input#disabled) của HTML, vốn sẽ thông báo cho điều khiển biểu mẫu là bị vô hiệu hóa về mặt ngữ nghĩa, thay đổi kiểu dáng của nó để phản ánh trạng thái đó, đồng thời vô hiệu hóa toàn bộ chức năng và không cho phép giá trị của phần tử tham gia vào việc gửi biểu mẫu, thì `aria-disabled="true"` **chỉ** bộc lộ các phần tử này là bị vô hiệu hóa về mặt ngữ nghĩa. Nhà phát triển web phải tự bảo đảm bằng tay rằng chức năng của các phần tử đó bị ngăn chặn khi chúng được bộc lộ ở trạng thái bị vô hiệu hóa.

Khi cần vô hiệu hóa các điều khiển biểu mẫu HTML gốc, nhà phát triển cần chỉ định thuộc tính `disabled`, vì nó cung cấp sẵn tất cả các tính năng thường được mong đợi của việc vô hiệu hóa một điều khiển. Tuy nhiên, cũng có những trường hợp cần bộc lộ phần tử như bị vô hiệu hóa nhưng vẫn để người dùng có thể tìm thấy khi điều hướng bằng phím <kbd>Tab</kbd>. Làm vậy có thể cải thiện khả năng phát hiện ra chúng vì chúng sẽ không bị loại khỏi thứ tự tiêu điểm của trang web, trong khi `aria-disabled` không thay đổi khả năng nhận tiêu điểm của các phần tử như vậy, và cũng không làm mờ các phần tử bằng kiểu dáng mặc định của trình duyệt, khiến chúng dễ đọc hơn. Một số ví dụ về nơi điều này có thể hữu ích gồm:

- Phần nút tiêu đề liên kết với một panel accordion không thể thu gọn,
- Một nút quan trọng cần giữ trong thứ tự tiêu điểm của trang, nhưng hành động hiện không khả dụng - chẳng hạn nút gửi biểu mẫu,
- Các mục tạm thời không hoạt động trong widget menu vốn nếu không sẽ bị bỏ qua khi điều hướng bằng bàn phím thông thường.

Trong mỗi trường hợp này, có thể muốn người dùng tìm thấy các phần tử này thông qua điều hướng bàn phím thông thường, dù chức năng của control đó đã bị loại bỏ hoặc "vô hiệu hóa". Nhà phát triển vẫn cần dùng JavaScript để vô hiệu hóa hoàn toàn chức năng của phần tử đồng thời thay đổi giao diện của phần tử để người dùng nhìn thấy được biết nó bị vô hiệu hóa.

> [!NOTE]
> Trạng thái bị vô hiệu hóa áp dụng cho phần tử có `aria-disabled="true"` và tất cả các phần tử con có thể nhận tiêu điểm của nó. Hãy cẩn thận khi dùng thuộc tính này trên các phần tử vùng chứa. Đặc biệt trong trường hợp một vùng chứa có cả điều khiển biểu mẫu và liên kết - khi mục đích có thể là bộc lộ điều khiển biểu mẫu là bị vô hiệu hóa, nhưng <strong>không</strong> truyền đạt rằng các liên kết cũng bị "vô hiệu hóa".

Một lý do khác để dùng thuộc tính `aria-disabled` thay cho thuộc tính `disabled` của HTML là nếu bạn tạo ra các control tùy chỉnh cần được đánh dấu là bị vô hiệu hóa nhưng không dùng phần tử hỗ trợ thuộc tính `disabled`. Ví dụ, trong đoạn sau, một `<div>` được dùng để tạo một nút tùy chỉnh cần được đánh dấu là bị vô hiệu hóa. Tuy nhiên, phần tử `<div>` không mong đợi, cũng không tôn trọng thuộc tính `disabled` - ngay cả khi nó được gán `role="button"` để thay đổi vai trò ARIA được bộc lộ của nó. Thuộc tính `aria-disabled` là bắt buộc để vô hiệu hóa các control tùy chỉnh như vậy.

```html
<div role="button" aria-disabled="true" tabindex="-1">Sửa</div>
```

Tương tự như việc cần dùng JavaScript để bảo đảm phần tử có `aria-disabled="true"` không hoạt động, phần tử đó cũng cần điều chỉnh kiểu dáng. Trái với thuộc tính `disabled` của HTML, nơi việc chỉ định nó sẽ làm các kiểu `:disabled` của tác nhân người dùng được áp dụng, việc thêm `aria-disabled="true"` thì không. Phần tử có thể được tạo kiểu bằng [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) `[aria-disabled="true"]`.

```css
[aria-disabled="true"] {
  opacity: 0.5;
}
```

Nếu bạn cố ý dùng thuộc tính `aria-disabled` để cho một control biểu mẫu vẫn nằm trong thứ tự tiêu điểm bàn phím của trang, đặc biệt nếu phần tử đại diện cho nội dung quan trọng mà tất cả người dùng nên có thể nhận biết, thì bạn có thể cần dùng kiểu dáng vẫn đáp ứng các yêu cầu tương phản màu. Ví dụ, một nút/tiêu đề bị vô hiệu hóa dùng để mở đầu một accordion panel không thể thu gọn là nội dung vẫn cần dễ đọc.

```css
@media (forced-colors: active) {
  [aria-disabled="true"] {
    border-color: GrayText;
    color: GrayText;
  }
}
```

Truy vấn media [`forced-colors`](/en-US/docs/Web/CSS/Reference/At-rules/@media/forced-colors) phát hiện xem [tác nhân người dùng](/en-US/docs/Glossary/User_agent) đã bật chế độ màu ép buộc hay chưa; nếu có, cả màu chữ và màu viền đều được đặt thành [màu hệ thống `greyText`](/en-US/docs/Web/CSS/Reference/Values/system-color#syntax).

Một điều khác cần lưu ý khi dùng `aria-disabled` thay cho thuộc tính HTML gốc là thuộc tính ARIA sẽ yêu cầu kiểu dáng thủ công cần thiết để truyền đạt trực quan rằng phần tử bị vô hiệu hóa trong Windows High Contrast Mode.

> [!NOTE]
> Nếu bạn dùng CSS [`pointer-events: none;`](/en-US/docs/Web/CSS/Reference/Properties/pointer-events) để làm cho một phần tử không thể nhấp, hãy bảo đảm bạn cũng vô hiệu hóa khả năng tương tác bằng JavaScript. `pointer-events: none;` ngăn các lần nhấp chuột, nhưng không ngăn phần tử được kích hoạt bằng bàn phím.

```js
function onClick(event) {
  event.preventDefault();
}

function toggleDisabled(element, status, update) {
  if (status) {
    // element.input.disabled = false;
    element.setAttribute("aria-disabled", "false");
    update.textContent = "Phần tử hiện đã được bật.";
    element.addEventListener("click", onClick);
  } else {
    // element.input.disabled = true;
    element.setAttribute("aria-disabled", "true");
    update.textContent = "Phần tử hiện đã bị vô hiệu hóa.";
    element.removeEventListener("click", onClick);
  }
}
```

Khi chuyển từ `aria-disabled="true"` sang `"false"`, hãy dùng JavaScript để:

1. Chuyển giá trị thành `false` (hoặc loại bỏ hoàn toàn thuộc tính),
2. Bật phần tử, và
3. Cho người dùng biết control hiện đã được bật.

Nếu bạn chỉ dùng CSS để tạo kiểu cho trạng thái bị vô hiệu hóa bằng bộ chọn thuộc tính, bộ chọn đó sẽ không còn khớp nữa và kiểu dáng vô hiệu hóa sẽ không còn hiệu lực.

## Giá trị

- `true`
  - : Phần tử bị vô hiệu hóa

- `false`
  - : Phần tử không bị vô hiệu hóa

## Giao diện liên quan

- {{domxref("Element.ariaDisabled")}}
  - : Thuộc tính [`ariaDisabled`](/en-US/docs/Web/API/Element/ariaDisabled), là một phần của giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-disabled`, vốn cho biết phần tử có thể được nhận biết nhưng bị vô hiệu hóa nên không thể chỉnh sửa hoặc thao tác.
- {{domxref("ElementInternals.ariaDisabled")}}
  - : Thuộc tính [`ariaDisabled`](/en-US/docs/Web/API/ElementInternals/ariaDisabled) của giao diện {{domxref("ElementInternals")}} phản ánh giá trị của thuộc tính `aria-disabled`.

## Vai trò liên quan

Được dùng trong các vai trò:

- [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
- [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role)
- [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role)
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
- [`input`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/input_role)
- [`link`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role)
- [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role)
- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
- [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)

Kế thừa vào các vai trò:

- [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role)
- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
- [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role)
- [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)
- [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
- [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
- [`radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role)
- [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role)
- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
- [`select`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/select_role)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
- [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)
- [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)
- [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
- [`toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role)
- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)
- [`treeitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- [Làm cho các nút bị vô hiệu hóa bao gồm hơn](https://css-tricks.com/making-disabled-buttons-more-inclusive/) bởi Sandrina Pereira
- [Styling for Windows high contrast with new standards for forced colors](https://blogs.windows.com/msedgedev/2020/09/17/styling-for-windows-high-contrast-with-new-standards-for-forced-colors/)
- [disabled](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
- {{domxref("Element.ariaDisabled")}}
- {{domxref("ElementInternals.ariaDisabled")}}
- [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden)
- [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly)
