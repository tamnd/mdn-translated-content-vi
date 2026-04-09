---
title: "ARIA: vai trò combobox"
short-title: combobox
slug: Web/Accessibility/ARIA/Reference/Roles/combobox_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#combobox,
  - https://www.w3.org/WAI/ARIA/apg/patterns/combobox/examples/combobox-select-only/
sidebar: accessibilitysidebar
---

Vai trò `combobox` xác định một phần tử là `input` hoặc `button` điều khiển một phần tử khác, như `listbox` hoặc `grid`, có thể bật ra động để giúp người dùng đặt giá trị. Một combobox có thể là có thể chỉnh sửa (cho phép nhập văn bản) hoặc chỉ chọn (chỉ cho phép chọn từ popup).

## Mô tả

`combobox` là một widget tổ hợp kết hợp một trường nhập có tên với một popup cung cấp các giá trị có thể có cho trường đó. Mục đích của widget này là cải thiện trải nghiệm người dùng bằng cách giúp họ chọn giá trị mà không cần gõ đầy đủ, và tùy thuộc vào việc các giá trị hợp lệ có bị giới hạn hay không, ngăn người dùng nhập giá trị không hợp lệ hoặc không được hỗ trợ.

Vai trò `combobox` có thể được đặt trên phần tử input cho combobox có thể chỉnh sửa, hoặc trên phần tử button cho combobox chỉ chọn. Phần tử này điều khiển một phần tử khác, như listbox hoặc grid, có thể bật lên động để giúp người dùng đặt giá trị.

Phần tử có vai trò `combobox` có thể là trường văn bản một dòng có thể chỉnh sửa (dùng phần tử {{HTMLElement('input')}}, tương tự như một phần tử có {{HTMLElement('datalist')}}), hoặc một phần tử chỉ chọn (dùng phần tử `button`) chỉ hiển thị giá trị hiện tại mà không cho phép nhập văn bản trực tiếp.

Một combobox WAI-ARIA chỉ yêu cầu một thuộc tính: [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded). Tuy nhiên, tùy cách triển khai, thường còn cần nhiều thuộc tính khác: [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup), [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls), [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant), và [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete).

Thông thường, trạng thái ban đầu của combobox là thu gọn, với `aria-expanded="false"`. Ở trạng thái thu gọn, chỉ phần tử combobox và, tùy chọn, một nút anh em để kích hoạt popup, là hiển thị. [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded), với giá trị `false`, là bắt buộc khi thu gọn, vì nó cho công nghệ hỗ trợ biết widget này có thể mở rộng.

Combobox ở trạng thái mở rộng khi cả phần tử combobox đang hiển thị giá trị hiện tại và phần tử popup liên quan của nó đều hiển thị. Khi mở rộng, phải đặt `aria-expanded="true"`.

Phần tử popup liên kết với `combobox` có thể là phần tử [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role), [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role), [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), hoặc [`dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role).

Combobox có giá trị ngầm định [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup) là `listbox`, nên thuộc tính này là tùy chọn nếu popup là `listbox`. Nếu phần tử popup của combobox là `tree`, `grid`, hoặc `dialog` (bất cứ thứ gì khác ngoài `listbox`), thuộc tính `aria-haspopup` là bắt buộc. Giá trị của `aria-haspopup` phải là một trong các vai trò `tree`, `grid`, `dialog`, hoặc `listbox`. Lưu ý rằng với thuộc tính này, `true` có nghĩa là `menu`, vì vậy hãy bảo đảm giá trị khớp với vai trò của popup, chứ không phải một giá trị boolean.

Khi popup của combobox được hiển thị, hãy bảo đảm thuộc tính [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls) trên phần tử combobox được đặt thành [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử popup `listbox`, `tree`, `grid`, hoặc `dialog`. Đây là cách chỉ ra mối quan hệ giữa phần tử có vai trò `combobox` và popup mà nó điều khiển. (Lưu ý: Trong các đặc tả ARIA cũ hơn, đây là `aria-owns` thay vì `aria-controls`, nên bạn có thể thấy `aria-owns` trong các triển khai combobox cũ. Hãy cập nhật `aria-owns` trong mã thành `aria-controls`!)

Nếu giao diện combobox có một điều khiển hiển thị, chẳng hạn một biểu tượng, cho phép kiểm soát việc hiển thị popup bằng các sự kiện con trỏ và chạm, điều khiển đó nên là một {{HTMLElement('button')}}, {{HTMLElement('input')}} kiểu `button`, hoặc một phần tử vai trò [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role) với [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) là `-1`. Làm vậy sẽ cho phép nút có thể nhận tiêu điểm nhưng không nằm trong chuỗi tab bàn phím. Nó không được là phần tử con của phần tử có vai trò `combobox`.

Để có thể truy cập bằng bàn phím, cần lập trình hỗ trợ bàn phím để chuyển tiêu điểm giữa phần tử `combobox` và các phần tử nằm trong popup `listbox`, `tree`, `grid`, hoặc `dialog`. Một quy ước phổ biến là <kbd>Down Arrow</kbd> chuyển tiêu điểm từ input tới phần tử con có thể nhận tiêu điểm đầu tiên của popup.

Thuộc tính [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant) có thể được dùng để xác định phần tử đang hoạt động hiện tại của popup combobox, chẳng hạn một `option` trong popup `listbox`, cho các triển khai mà tiêu điểm DOM vẫn ở trên combobox. Nếu tiêu điểm DOM không ở lại trên combobox khi popup của nó được kích hoạt, mà thay vào đó tiêu điểm DOM chuyển vào popup, như một dialog, thì `aria-activedescendant` có thể không cần thiết.

Nếu combobox được triển khai như một phần tử {{HTMLElement('input')}} có thể chỉnh sửa, giá trị của combobox là giá trị của input. Với combobox chỉ chọn được triển khai bằng phần tử `button`, giá trị đến từ option đã chọn trong popup.

Thuộc tính [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete) chỉ áp dụng cho combobox có thể chỉnh sửa và hỗ trợ nhập văn bản. Với những combobox này, hãy đặt thuộc tính theo giá trị tương ứng với hành vi được cung cấp: `inline`, `list`, hoặc `both`. Thuộc tính này cho biết việc nhập văn bản sẽ kích hoạt việc hiển thị một hoặc nhiều dự đoán về giá trị mà người dùng muốn và chỉ định cách các dự đoán đó được trình bày. Với combobox chỉ chọn dùng phần tử `button`, không nên dùng `aria-autocomplete` vì không thể nhập văn bản.

Mỗi `combobox` phải có một tên truy cập, có thể được cung cấp theo một trong ba cách:

1. Với phần tử {{HTMLElement('input')}}, dùng một {{HTMLElement('label')}} liên kết.
2. Nếu có nhãn hiển thị trong giao diện, dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) tham chiếu tới `id` của phần tử nhãn.
3. Nếu không có nhãn hiển thị, dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label).

> [!NOTE]
> Chỉ dùng một trong các cách này; đừng kết hợp chúng.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
  - : Bắt buộc. Xác định combobox đang mở (`true`) hay đóng (`false`).
- [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup)
  - : Ngầm định. Nếu bỏ qua, mặc định là `listbox`. Cũng hỗ trợ `tree`, `grid`, hoặc `dialog`. Xác định combobox có một popup bật ra và cho biết loại của nó.

### Tương tác bàn phím

- <kbd>Down Arrow</kbd>
  - : Mở popup nếu đang đóng và chuyển tiêu điểm tới option tiếp theo, hoặc tới option đầu tiên nếu chưa có option nào được chọn.

- <kbd>Alt</kbd> + <kbd>Down Arrow</kbd> (Tùy chọn)
  - : Nếu popup có sẵn nhưng chưa hiển thị, hiển thị popup mà không chuyển tiêu điểm.

- <kbd>Up Arrow</kbd>
  - : Mở popup nếu đang đóng và chuyển tiêu điểm tới option trước đó, hoặc tới option cuối cùng nếu chưa có option nào được chọn.

- <kbd>Alt</kbd> + <kbd>Up Arrow</kbd> (Tùy chọn)
  - : Nếu popup đang có tiêu điểm, trả tiêu điểm về combobox, nếu không thì đóng popup.

- <kbd>Escape</kbd>
  - : Đóng popup nếu đang mở. Nếu popup đã đóng, xóa giá trị combobox đối với combobox có thể chỉnh sửa.

#### Tương tác bàn phím của combobox có thể chỉnh sửa

- <kbd>Enter</kbd>
  - : Nếu một gợi ý tự động hoàn thành đang được chọn trong popup, chấp nhận gợi ý bằng cách cập nhật giá trị combobox và đặt con trỏ nhập ở cuối.
    Cũng có thể kích hoạt một hành động mặc định (ví dụ, trong ứng dụng nhắn tin, thêm giá trị đã chấp nhận vào danh sách người nhận).

- <kbd>Tab</kbd>
  - : Chấp nhận giá trị hiện tại và chuyển tiêu điểm tới phần tử có thể nhận tiêu điểm tiếp theo.

#### Tương tác bàn phím của combobox chỉ chọn

- <kbd>Enter</kbd> hoặc <kbd>Space</kbd>
  - : Khi popup đang đóng, mở popup. Khi popup đang mở và một option được chọn, chấp nhận option đã chọn làm giá trị combobox và đóng popup.

- <kbd>Tab</kbd>
  - : Chấp nhận lựa chọn hiện tại và chuyển tiêu điểm tới phần tử có thể nhận tiêu điểm tiếp theo.

- <kbd>Home</kbd> hoặc <kbd>End</kbd>
  - : Khi popup đang mở, chuyển tiêu điểm tới option đầu tiên hoặc cuối cùng tương ứng.

## Ví dụ

```html
<label for="jokes">Chọn kiểu truyện cười bạn thích</label>
<div class="combo-wrap">
  <input
    type="text"
    id="jokes"
    role="combobox"
    aria-controls="joketypes"
    aria-autocomplete="list"
    aria-expanded="false"
    data-active-option="item1"
    aria-activedescendant="" />
  <span aria-hidden="true" data-trigger="multiselect"></span>
  <ul id="joketypes" role="listbox" aria-label="Truyện cười">
    <li class="active" role="option" id="item1">Chơi chữ</li>
    <li class="option" role="option" id="item2">Câu đố</li>
    <li class="option" role="option" id="item3">Quan sát</li>
    <li class="option" role="option" id="item4">Gõ cửa</li>
    <li class="option" role="option" id="item5">Câu ngắn</li>
  </ul>
</div>
```

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement('label')}}
- Phần tử HTML {{HTMLElement('select')}}
- Phần tử HTML {{HTMLElement('option')}}
- Phần tử HTML {{HTMLElement('input')}}
- [vai trò `listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
- [vai trò `option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
- [vai trò `list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
- [vai trò `listitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role)
- [ARIA Best Practices – Combobox](https://www.w3.org/WAI/ARIA/apg/patterns/combobox/)
- [Ví dụ mô-đun combobox có thể truy cập](https://dequelabs.github.io/combobo/demo/) của Deque
