---
title: "ARIA: vai trò radiogroup"
short-title: radiogroup
slug: Web/Accessibility/ARIA/Reference/Roles/radiogroup_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#radiogroup
  - https://www.w3.org/WAI/ARIA/apg/patterns/radio/examples/radio/
sidebar: accessibilitysidebar
---

Vai trò `radiogroup` là một nhóm các nút `radio`.

## Mô tả

Radio group là các tập hợp mô tả một tập các tùy chọn [`radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role) có liên quan. `radiogroup` là một kiểu danh sách [`select`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/select_role) chỉ có thể có một mục, hoặc `radio`, được chọn tại một thời điểm.

Khi dùng radio button input gốc của HTML, [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio), các radio button được nhóm lại khi mỗi input radio button trong nhóm được gán cùng một [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name). Sau khi một nhóm radio button cùng tên được thiết lập, việc chọn bất kỳ input radio button nào trong nhóm đó sẽ tự động bỏ chọn mọi input radio button hiện đang được chọn trong cùng nhóm. Mặc dù điều này liên kết các radio button với nhau, để hiển thị một nhóm radio button như một `radiogroup` thì hãy đặt rõ ràng vai trò ARIA.

Nên tạo radio group bằng các radio button input HTML cùng tên, nhưng nếu bạn buộc phải dùng vai trò và thuộc tính ARIA thay vì các điều khiển form HTML ngữ nghĩa, thì các nút radio tùy chỉnh có thể và nên hoạt động giống các nút radio input HTML gốc.

Khi dùng các phần tử không ngữ nghĩa làm radio button, bạn phải bảo đảm người dùng chỉ có thể chọn một radio button từ nhóm tại một thời điểm. Khi một mục trong nhóm được chọn, với thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) được đặt thành `true`, mục đã chọn trước đó sẽ bị bỏ chọn, với thuộc tính `aria-checked` đổi thành `false`. Thuộc tính `aria-checked` được đặt trên các vai trò `radio` liên quan, không phải trên chính `radiogroup`.

Một số triển khai `radiogroup` khởi tạo tập với tất cả các nút ở trạng thái chưa chọn. Khi một `radio` trong `radiogroup` đã được chọn, thông thường không thể quay về trạng thái tất cả đều chưa chọn.

`radiogroup` phải có một tên khả năng tiếp cận либо bằng một nhãn hiển thị được tham chiếu bởi [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) hoặc có nhãn được chỉ định bằng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label). Nếu có các phần tử cung cấp thêm thông tin về radio group, những phần tử đó được tham chiếu bởi phần tử `radiogroup` bằng thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby).

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- Vai trò [`radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role)
  - : Một trong một nhóm các nút có thể đánh dấu, trong `radiogroup`, nơi không quá một nút có thể được đánh dấu tại một thời điểm.
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) / [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : `radiogroup` phải có một tên khả năng tiếp cận либо bằng nhãn hiển thị được tham chiếu bởi `aria-labelledby` hoặc có nhãn được chỉ định bằng `aria-label`.
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
  - : Tham chiếu tới các phần tử cung cấp thông tin bổ sung về `radiogroup`
- [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required)
  - : Chỉ ra rằng một `radio` trong nhóm phải được đặt `aria-checked="true"` trước khi form có thể được gửi. Trạng thái bắt buộc được chỉ định trên phần tử `radiogroup` thay vì trên một trong các phần tử `radio`, khác với khi dùng radio button HTML, nơi thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) được đặt trực tiếp trên một hoặc nhiều phần tử {{HTMLElement('input')}} radio.
- [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
  - : Xác định phần tử cung cấp thông báo lỗi cho `radiogroup`, nếu có lỗi. Thông báo đó nên được ẩn khi không còn liên quan.

### Tương tác bàn phím

Đối với các nút `radio` trong một `radiogroup` KHÔNG nằm trong một [`toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role), các tương tác bàn phím sau phải được hỗ trợ:

- <kbd>Tab</kbd> và <kbd>Shift + Tab</kbd>
  - : Di chuyển focus vào và ra khỏi `radiogroup`. Khi focus đi vào một `radiogroup`, nếu một radio button đã được chọn, focus được đặt lên nút đã chọn. Nếu không radio button nào được chọn, focus được đặt lên radio button đầu tiên trong nhóm.
- <kbd>Space</kbd>
  - : Chọn radio button đang focus nếu nó chưa được chọn.
- <kbd>Right Arrow</kbd> và <kbd>Down Arrow</kbd>
  - : Chuyển focus tới radio button tiếp theo trong nhóm, bỏ chọn nút trước đó đang được focus, và chọn nút mới được focus. Nếu focus ở nút cuối, focus chuyển tới nút đầu.
- <kbd>Left Arrow</kbd> và <kbd>Up Arrow</kbd>
  - : Chuyển focus tới radio button trước đó trong nhóm, bỏ chọn nút trước đó đang được focus, và chọn nút mới được focus. Nếu focus ở nút đầu, focus chuyển tới nút cuối.

Phím mũi tên được dùng để điều hướng giữa các phần tử của toolbar. Khi một `radiogroup` được lồng trong toolbar, người dùng cần có thể điều hướng giữa mọi phần tử của toolbar, bao gồm các radio button, mà không làm thay đổi radio button nào đang được chọn. Vì vậy, khi điều hướng trong một `radiogroup` trong [`toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role) bằng phím mũi tên, nút được chọn không thay đổi. Thay vào đó, khi ở trong một `toolbar`, phím <kbd>Space</kbd> và <kbd>Enter</kbd> sẽ chọn radio `radio` đang focus nếu nó chưa được chọn, còn <kbd>Tab</kbd> di chuyển focus vào và ra khỏi `toolbar`.

### Các tính năng JavaScript bắt buộc

Tương tác của người dùng với `radiogroup` phải tái tạo lại tương tác của người dùng khi đi vào một nhóm radio button HTML cùng tên. Các sự kiện bàn phím cho tab, space và phím mũi tên phải được bắt. Các sự kiện click trên cả phần tử radio và nhãn liên quan của chúng cũng phải được bắt. Ngoài ra, [focus phải được quản lý](https://primer.style/accessibility/design-guidance/focus-management/).

Mặc dù nói chung việc di chuyển khỏi một phần tử đang focus sẽ đưa bạn tới phần tử có thể focus tiếp theo theo thứ tự DOM, việc dùng phím mũi tên để điều hướng trong một nhóm radio button sẽ giữ bạn trong nhóm, chuyển focus tới radio button đầu tiên khi <kbd>Right Arrow</kbd> hoặc <kbd>Down Arrow</kbd> được nhả nếu focus đang ở radio cuối cùng trong nhóm, và chuyển tới radio cuối cùng nếu <kbd>Left Arrow</kbd> hoặc <kbd>Up Arrow</kbd> được nhả nếu focus đang ở radio đầu tiên. Quản lý roving [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) là một cách để quản lý các sự kiện phím mũi tên.

### Các tính năng CSS bắt buộc

Dùng bộ chọn thuộc tính `[aria-checked="true"]` để tạo kiểu cho trạng thái được chọn của các nút radio đã chọn.

Dùng các lớp giả CSS {{CSSXRef(':hover')}} và {{CSSXRef(':focus')}} để tạo kiểu cho focus và hover trực quan. Hiệu ứng focus và hover nên bao trùm cả radio button lẫn nhãn để dễ nhận biết tùy chọn nào đang được chọn và để cho thấy rằng nhấp vào nhãn hoặc nút đều sẽ kích hoạt radio button.

## Ví dụ

Thiết lập cơ bản cho một `radiogroup` dùng các vai trò ARIA không ngữ nghĩa thay vì HTML ngữ nghĩa như sau:

```html
<div role="radiogroup" aria-labelledby="question">
  <div id="question">Which is the best color?</div>
  <div id="radioGroup">
    <p>
      <span
        id="colorOption_0"
        tabindex="0"
        role="radio"
        aria-checked="false"
        aria-labelledby="purple"></span>
      <span id="purple">Purple</span>
    </p>
    <p>
      <span
        id="colorOption_1"
        tabindex="-1"
        role="radio"
        aria-checked="false"
        aria-labelledby="aubergine"></span>
      <span id="aubergine">Aubergine</span>
    </p>
    <p>
      <span
        id="colorOption_2"
        tabindex="-1"
        role="radio"
        aria-checked="false"
        aria-labelledby="magenta"></span>
      <span id="magenta">Magenta</span>
    </p>
    <p>
      <span
        id="colorOption_3"
        tabindex="-1"
        role="radio"
        aria-checked="false"
        aria-labelledby="all"></span>
      <span id="all">All of the above</span>
    </p>
  </div>
</div>
```

Có thể viết điều này bằng HTML ngữ nghĩa, không cần CSS hay JavaScript:

```html
<fieldset>
  <legend>Which is the best color?</legend>
  <p>
    <input name="colorOption" type="radio" id="purple" />
    <label for="purple">Purple</label>
  </p>
  <p>
    <input name="colorOption" type="radio" id="aubergine" />
    <label for="aubergine">Aubergine</label>
  </p>
  <p>
    <input name="colorOption" type="radio" id="magenta" />
    <label for="magenta">Magenta</label>
  </p>
  <p>
    <input name="colorOption" type="radio" id="all" />
    <label for="all">All of the above</label>
  </p>
</fieldset>
```

Trong ví dụ {{HTMLElement('fieldset')}} này, mặc dù `role="radiogroup"` không cần thiết, nhưng để nhóm này được công bố rõ ràng là `radiogroup`, hãy bao gồm vai trò ARIA.

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử HTML {{HTMLElement('fieldset')}}
- Phần tử radio button HTML {{HTMLElement('input/radio', '&lt;input type="radio">')}}
- [ARIA `radio` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role)
- [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
- [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid)
- [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly)
- [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required)
