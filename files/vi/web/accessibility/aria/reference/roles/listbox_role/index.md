---
title: "ARIA: vai trò listbox"
short-title: listbox
slug: Web/Accessibility/ARIA/Reference/Roles/listbox_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#listbox
  - https://www.w3.org/WAI/ARIA/apg/patterns/listbox/examples/listbox-scrollable/
sidebar: accessibilitysidebar
---

Vai trò `listbox` được dùng cho các danh sách mà từ đó người dùng có thể chọn một hoặc nhiều mục tĩnh và, không giống như các phần tử HTML {{HTMLElement('select')}}, có thể chứa hình ảnh.

## Mô tả

Vai trò `listbox` được dùng để xác định một phần tử tạo ra danh sách mà người dùng có thể chọn một hoặc nhiều mục tĩnh, tương tự phần tử HTML {{HTMLElement('select')}}. Không giống {{HTMLElement('select')}}, listbox có thể chứa hình ảnh. Listbox chứa các phần tử con có vai trò [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role) hoặc các phần tử có vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role), mà bên trong chúng lại chứa các phần tử con có vai trò `option`.

Nên ưu tiên dùng phần tử HTML select, hoặc một nhóm radio nếu chỉ có thể chọn một mục, hoặc một nhóm checkbox nếu có thể chọn nhiều mục, vì có rất nhiều tương tác bàn phím cần được quản lý tiêu điểm cho toàn bộ các phần tử con, trong khi các phần tử HTML gốc đã cung cấp sẵn chức năng này cho bạn.

Các phần tử có vai trò `listbox` có giá trị ngầm định của [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation) là `vertical`.

Khi tab tới một danh sách, mục đầu tiên trong danh sách sẽ được chọn nếu trước đó chưa có mục nào khác được chọn. Phím mũi tên lên/xuống điều hướng trong danh sách, và nhấn Shift + phím mũi tên lên/xuống sẽ di chuyển đồng thời mở rộng vùng chọn. Gõ một hoặc nhiều chữ cái sẽ điều hướng các mục danh sách (cùng một chữ cái sẽ đi tới mỗi mục bắt đầu bằng chữ đó, còn nhiều chữ cái khác nhau sẽ đi tới mục đầu tiên bắt đầu bằng cả chuỗi đó). Nếu mục hiện tại có menu ngữ cảnh liên quan, Shift+F10 sẽ mở menu đó. Nếu các mục danh sách có thể đánh dấu, Space có thể được dùng để chuyển trạng thái [checkboxes](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role). Với các mục có thể chọn, Space chuyển đổi vùng chọn của chúng, Shift+Space có thể được dùng để chọn các mục liên tiếp, Ctrl+Arrow di chuyển mà không chọn, và Ctrl+Space có thể được dùng để chọn các mục không liên tiếp. Nên có một checkbox, liên kết hoặc cách khác để chọn tất cả các mục, và có thể dùng Ctrl+A làm phím tắt cho việc này.

Khi vai trò listbox được thêm vào một phần tử, hoặc khi phần tử đó trở nên hiển thị, trình đọc màn hình sẽ thông báo nhãn và vai trò của listbox khi nó nhận tiêu điểm. Nếu một option hoặc mục được đưa tiêu điểm bên trong danh sách, mục đó sẽ được thông báo tiếp theo, kèm chỉ báo về vị trí của mục trong danh sách nếu trình đọc màn hình hỗ trợ. Khi tiêu điểm di chuyển trong danh sách, trình đọc màn hình sẽ thông báo các mục liên quan.

### Các vai trò, trạng thái và thuộc tính ARIA liên quan

#### Các vai trò liên quan

- vai trò [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
  - : Cần có một hoặc nhiều option lồng bên trong. Tất cả option đã chọn đều có [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) được đặt thành `true`. Tất cả option không được chọn đều có [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) được đặt thành `false`. Nếu một option không thể chọn, hãy bỏ qua [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected).
- vai trò [`list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
  - : Một phần chứa các phần tử `listitem`

#### Trạng thái và thuộc tính

- [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
  - : Giữ chuỗi `id` của phần tử hiện đang hoạt động bên trong listbox. Nếu đó là một option, thì đó sẽ là `id` của option được tương tác gần nhất, bất kể option đó có giá trị [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) là `true` hay không. Chỉ nhận giá trị của một `id`, ngay cả trong listbox có nhiều lựa chọn. Nếu `id` đó không trỏ đến một phần tử con DOM của listbox, thì `id` đó phải được bao gồm trong số các `id` trong thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns).
- [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)
  - : Đây là danh sách các `id` phần tử được phân tách bằng khoảng trắng, không phải là phần tử con DOM của listbox. Các `id` được liệt kê ở đây cũng không thể được liệt kê trong các thuộc tính [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns) của bất kỳ phần tử nào khác.

- [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable)
  - : Bao gồm và đặt thành `true` nếu người dùng có thể chọn nhiều hơn một option. Nếu đặt `true`, _mọi_ option có thể chọn đều phải có thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) và được đặt thành `true` hoặc `false`. Các option _không_ thể chọn _không nên_ có thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected). Nếu là `false` hoặc bị bỏ qua, chỉ option hiện được chọn, nếu có, mới cần thuộc tính [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected), và nó phải được đặt thành `true`.

- [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required)
  - : Một thuộc tính Boolean cho biết phải chọn một option có giá trị chuỗi không rỗng.

- [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly)
  - : Người dùng không thể thay đổi option nào đang được chọn hoặc bỏ chọn, nhưng listbox vẫn có thể vận hành.

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Một giá trị chuỗi dễ đọc bởi con người dùng để xác định listbox. Nếu có nhãn hiển thị, hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) để tham chiếu tới nhãn đó thay thế.

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Xác định phần tử hoặc các phần tử hiển thị trong danh sách `id` phần tử được phân tách bằng khoảng trắng để nhận diện listbox. Nếu không có nhãn hiển thị, hãy dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) thay thế để thêm nhãn. (Lưu ý: "labelled" với hai chữ L là cách viết đúng theo quy ước của API trợ năng.)

- [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription)
  - : Một giá trị chuỗi dễ đọc bởi con người mô tả rõ hơn vai trò của listbox. Trình đọc màn hình thường sẽ đọc giá trị này cho người dùng sau khi đọc nhãn (nếu có), thay vì nói "listbox".

### Tương tác bàn phím

- Khi một listbox chọn đơn nhận tiêu điểm:
  - Nếu chưa có option nào được chọn trước khi listbox nhận tiêu điểm, option đầu tiên sẽ nhận tiêu điểm. Tùy chọn, option đầu tiên cũng có thể được tự động chọn.
  - Nếu một option đã được chọn trước khi listbox nhận tiêu điểm, tiêu điểm sẽ được đặt trên option đã chọn.

- Khi một listbox nhiều lựa chọn nhận tiêu điểm:
  - Nếu chưa có option nào được chọn trước khi listbox nhận tiêu điểm, tiêu điểm sẽ được đặt trên option đầu tiên và không có thay đổi tự động nào về trạng thái chọn.
  - Nếu một hoặc nhiều option đã được chọn trước khi listbox nhận tiêu điểm, tiêu điểm sẽ được đặt trên option đầu tiên trong danh sách hiện được chọn.

- <kbd>Down Arrow</kbd>

  : Di chuyển tiêu điểm tới option tiếp theo. Tùy chọn, trong listbox chọn đơn, vùng chọn cũng có thể di chuyển cùng tiêu điểm.

- <kbd>Up Arrow</kbd>

  : Di chuyển tiêu điểm tới option trước đó. Tùy chọn, trong listbox chọn đơn, vùng chọn cũng có thể di chuyển cùng tiêu điểm.

- <kbd>Home</kbd>

  (Tùy chọn): Di chuyển tiêu điểm tới option đầu tiên. Tùy chọn, trong listbox chọn đơn, vùng chọn cũng có thể di chuyển cùng tiêu điểm. Hỗ trợ phím này rất được khuyến khích cho các danh sách có hơn năm option.

- <kbd>End</kbd>

  (Tùy chọn): Di chuyển tiêu điểm tới option cuối cùng. Tùy chọn, trong listbox chọn đơn, vùng chọn cũng có thể di chuyển cùng tiêu điểm. Hỗ trợ phím này rất được khuyến khích cho các danh sách có hơn năm option.

- Type-ahead được khuyến nghị cho mọi listbox, đặc biệt là những listbox có hơn bảy option:
  - Gõ một ký tự: tiêu điểm chuyển tới mục tiếp theo có tên bắt đầu bằng ký tự đã gõ.
  - Gõ nhiều ký tự liên tiếp nhanh chóng: tiêu điểm chuyển tới mục tiếp theo có tên bắt đầu bằng chuỗi ký tự đã gõ.

- **Chọn nhiều**: Tác giả có thể triển khai một trong hai mô hình tương tác để hỗ trợ chọn nhiều: mô hình được khuyến nghị không yêu cầu người dùng giữ phím bổ trợ, chẳng hạn <kbd>Shift</kbd> hoặc <kbd>Control</kbd>, khi điều hướng danh sách, hoặc một mô hình thay thế yêu cầu giữ phím bổ trợ trong khi điều hướng để tránh mất trạng thái chọn.
  - Mô hình chọn được khuyến nghị - không cần giữ phím bổ trợ:
    - <kbd>Space</kbd>: thay đổi trạng thái chọn của option đang có tiêu điểm.
    - <kbd>Shift + Down Arrow</kbd> (Tùy chọn): Di chuyển tiêu điểm tới và chuyển trạng thái chọn của option tiếp theo.
    - <kbd>Shift + Up Arrow</kbd> (Tùy chọn): Di chuyển tiêu điểm tới và chuyển trạng thái chọn của option trước đó.
    - <kbd>Shift + Space</kbd> (Tùy chọn): Chọn các mục liên tiếp từ mục được chọn gần đây nhất tới mục đang có tiêu điểm.
    - <kbd>Control + Shift + Home</kbd> (Tùy chọn): Chọn option đang có tiêu điểm và tất cả option tới option đầu tiên. Tùy chọn, di chuyển tiêu điểm tới option đầu tiên.
    - <kbd>Control + Shift + End</kbd> (Tùy chọn): Chọn option đang có tiêu điểm và tất cả option tới option cuối cùng. Tùy chọn, di chuyển tiêu điểm tới option cuối cùng.
    - <kbd>Control + A</kbd> (Tùy chọn): Chọn tất cả option trong danh sách. Tùy chọn, nếu tất cả option đều được chọn, nó cũng có thể bỏ chọn tất cả.

### Các tính năng JavaScript bắt buộc

#### chọn một option trong listbox chọn đơn

Khi người dùng chọn một option, phải xảy ra các bước sau:

1. Bỏ chọn option đã được chọn trước đó, đặt [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) thành `false`, hoặc xóa hẳn thuộc tính này, rồi thay đổi giao diện của option vừa bị bỏ chọn để nó trông như không được chọn.
2. Chọn option mới, đặt `aria-selected="true"` trên option và thay đổi giao diện của option mới để nó trông được chọn.
3. Cập nhật giá trị [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant) trên listbox thành `id` của option vừa được chọn.
4. Xử lý trực quan các trạng thái blur, focus và selected của option

#### Chuyển trạng thái của option trong listbox nhiều lựa chọn

Khi người dùng nhấp vào một option, nhấn <kbd>Space</kbd> khi đang có tiêu điểm trên một option, hoặc bằng cách nào đó chuyển trạng thái của một option, phải xảy ra các bước sau:

1. Chuyển đổi trạng thái [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected) của option hiện đang có tiêu điểm, đổi trạng thái `aria-selected` thành true nếu nó là false, hoặc false nếu nó là true.
2. Thay đổi giao diện của option để phản ánh trạng thái chọn của nó
3. Cập nhật giá trị [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant) trên listbox thành ID của option mà người dùng vừa tương tác, ngay cả khi họ chuyển option đó sang trạng thái chưa được chọn.

> [!NOTE]
> Quy tắc đầu tiên khi dùng ARIA là nếu bạn có thể dùng một tính năng gốc với ngữ nghĩa và hành vi bạn cần đã được tích hợp sẵn, thay vì tái sử dụng một phần tử và **thêm** vai trò, trạng thái hoặc thuộc tính ARIA để làm nó có thể truy cập, thì hãy làm vậy. Phần tử {{HTMLElement('select')}} với các phần tử {{HTMLElement('option')}} con sẽ xử lý mọi tương tác cần thiết một cách nguyên gốc.

## Ví dụ

### Ví dụ 1: Listbox chọn đơn dùng `aria-activedescendant`

Đoạn mã dưới đây, dùng [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant), cho thấy cách vai trò listbox được thêm trực tiếp vào mã nguồn HTML.

```html
<p id="listbox1label" role="label">Chọn một màu:</p>
<div
  role="listbox"
  tabindex="0"
  id="listbox1"
  aria-labelledby="listbox1label"
  aria-activedescendant="listbox1-1">
  <div role="option" id="listbox1-1" class="selected" aria-selected="true">
    Xanh lá
  </div>
  <div role="option" id="listbox1-2">Cam</div>
  <div role="option" id="listbox1-3">Đỏ</div>
  <div role="option" id="listbox1-4">Xanh dương</div>
  <div role="option" id="listbox1-5">Tím</div>
  <div role="option" id="listbox1-6">Xanh periwinkle</div>
</div>
```

```js
const listbox = document.getElementById("listbox1");
listbox.addEventListener("click", listItemClick);
listbox.addEventListener("keydown", listItemKeyEvent);
listbox.addEventListener("keypress", listItemKeyEvent);
```

Việc này có thể đã được xử lý dễ dàng hơn bằng các phần tử HTML nguyên gốc {{HTMLElement('select')}} và {{HTMLElement('label')}}.

```html
<label for="listbox1">Chọn một màu:</label>
<select id="listbox1">
  <option selected>Xanh lá</option>
  <option>Cam</option>
  <option>Đỏ</option>
  <option>Xanh dương</option>
  <option>Tím</option>
  <option>Xanh periwinkle</option>
</select>
```

### Thêm ví dụ

- [Ví dụ Listbox có thể cuộn](https://www.w3.org/WAI/ARIA/apg/patterns/listbox/examples/listbox-scrollable/): Listbox chọn đơn có thể cuộn để hiển thị thêm option, tương tự HTML {{HTMLElement('select')}} với thuộc tính `size` lớn hơn một.
- [Ví dụ Listbox với các option được nhóm](https://www.w3.org/WAI/ARIA/apg/patterns/listbox/examples/listbox-grouped/): Listbox chọn đơn có các option được nhóm, tương tự HTML {{HTMLElement('select')}} với thuộc tính `size` được đặt lớn hơn `"1"` và các option được nhóm bằng phần tử `optgroup`.
- [Ví dụ listbox với các option có thể sắp xếp lại](https://www.w3.org/WAI/ARIA/apg/patterns/listbox/examples/listbox-rearrangeable/): Các ví dụ cho cả listbox chọn đơn và nhiều lựa chọn đi kèm thanh công cụ, nơi các option có thể được thêm, di chuyển và xóa.

## Thực hành tốt nhất

- Để có thể truy cập bằng bàn phím, tác giả nên [quản lý tiêu điểm](https://w3c.github.io/aria/#managingfocus) của toàn bộ phần tử con trong vai trò này.
- Nên dùng kiểu trình bày khác nhau cho vùng chọn khi danh sách không có tiêu điểm, ví dụ vùng chọn không hoạt động thường được hiển thị bằng màu nền nhạt hơn.
- Nếu listbox không phải là một phần của widget khác, nó nên có thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) được đặt.
- Nếu một hoặc nhiều mục không phải là phần tử con DOM của listbox, cần đặt thêm các thuộc tính `aria-*` khác (xem [ARIA Best Practices](https://www.w3.org/WAI/ARIA/apg/patterns/listbox/)).
- Nếu có lý do hợp lệ để [mở rộng](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) listbox, vai trò [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role) có thể phù hợp hơn.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement('select')}}
- Phần tử HTML {{HTMLElement('label')}}
- Phần tử HTML {{HTMLElement('option')}}
- [ARIA: vai trò `combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [ARIA: vai trò `option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
- [ARIA: vai trò `list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
- [ARIA: vai trò `listitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role)
- [ARIA Best Practices – Listbox](https://www.w3.org/WAI/ARIA/apg/patterns/listbox/)
