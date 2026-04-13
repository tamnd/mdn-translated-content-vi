---
title: KeyboardEvent
slug: Web/API/KeyboardEvent
page-type: web-api-interface
browser-compat: api.KeyboardEvent
---

{{APIRef("UI Events")}}

Các đối tượng **`KeyboardEvent`** mô tả tương tác của người dùng với bàn phím; mỗi sự kiện mô tả một tương tác đơn lẻ giữa người dùng và một phím (hoặc tổ hợp phím với các phím bổ trợ) trên bàn phím. Loại sự kiện ({{domxref("Element/keydown_event", "keydown")}}, {{domxref("Element/keypress_event", "keypress")}}, hoặc {{domxref("Element/keyup_event", "keyup")}}) xác định loại hoạt động bàn phím nào đã xảy ra.

> [!NOTE]
> Các sự kiện `KeyboardEvent` chỉ cho biết tương tác nào mà người dùng đã thực hiện với một phím trên bàn phím ở mức thấp, không cung cấp ý nghĩa ngữ cảnh cho tương tác đó. Khi bạn cần xử lý nhập văn bản, hãy sử dụng sự kiện {{domxref("Element/input_event", "input")}} thay thế. Các sự kiện bàn phím có thể không được kích hoạt nếu người dùng đang sử dụng phương tiện nhập văn bản thay thế, chẳng hạn như hệ thống viết tay trên máy tính bảng hoặc bảng vẽ đồ họa.

{{InheritanceDiagram}}

## Constructor

- {{domxref("KeyboardEvent.KeyboardEvent", "KeyboardEvent()")}}
  - : Tạo một đối tượng `KeyboardEvent` mới.

## Hằng số

Giao diện `KeyboardEvent` định nghĩa các hằng số sau.

### Vị trí bàn phím

Các hằng số sau xác định sự kiện phím bắt nguồn từ phần nào của bàn phím. Chúng được truy cập dưới dạng `KeyboardEvent.DOM_KEY_LOCATION_STANDARD`, v.v.

<table class="standard-table">
  <caption>
    Các định danh vị trí bàn phím
  </caption>
  <thead>
    <tr>
      <th scope="col">Hằng số</th>
      <th scope="col">Giá trị</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>DOM_KEY_LOCATION_STANDARD</code></td>
      <td>0x00</td>
      <td>
        <p>
          Phím được mô tả bởi sự kiện không được xác định là nằm ở một khu vực
          cụ thể nào của bàn phím; nó không nằm trên bàn phím số (trừ khi đó là phím NumLock),
          và đối với các phím bị trùng lặp ở bên trái và bên phải bàn phím,
          phím đó vì lý do nào đó không được liên kết với vị trí đó.
        </p>
        <p>
          Ví dụ bao gồm các phím chữ và số trên bàn phím PC 101 US tiêu chuẩn,
          phím NumLock và phím cách.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>DOM_KEY_LOCATION_LEFT</code></td>
      <td>0x01</td>
      <td>
        <p>
          Phím là một phím có thể tồn tại ở nhiều vị trí trên bàn phím
          và trong trường hợp này, nó nằm ở bên trái của bàn phím.
        </p>
        <p>
          Ví dụ bao gồm phím Control trái, phím Command trái trên bàn phím Macintosh,
          hoặc phím Shift trái.
        </p>
      </td>
    </tr>
    <tr>
      <td><code>DOM_KEY_LOCATION_RIGHT</code></td>
      <td>0x02</td>
      <td>
        <p>
          Phím là một phím có thể tồn tại ở nhiều vị trí trên bàn phím
          và trong trường hợp này, nó nằm ở bên phải của bàn phím.
        </p>
        <p>
          Ví dụ bao gồm phím Shift phải và phím Alt phải (Option trên bàn phím Mac).
        </p>
      </td>
    </tr>
    <tr>
      <td><code>DOM_KEY_LOCATION_NUMPAD</code></td>
      <td>0x03</td>
      <td>
        <p>
          Phím nằm trên bàn phím số, hoặc là một phím ảo
          được liên kết với bàn phím số nếu có nhiều hơn một nơi phím
          có thể bắt nguồn. Phím NumLock không thuộc nhóm
          này và luôn được mã hóa với vị trí
          <code>DOM_KEY_LOCATION_STANDARD</code>.
        </p>
        <p>
          Ví dụ bao gồm các chữ số trên bàn phím số, phím Enter của bàn phím số,
          và dấu thập phân trên bàn phím số.
        </p>
      </td>
    </tr>
  </tbody>
</table>

## Thuộc tính instance

_Giao diện này cũng kế thừa các thuộc tính từ cha của nó, {{domxref("UIEvent")}} và {{domxref("Event")}}._

- {{domxref("KeyboardEvent.altKey")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean là `true` nếu phím <kbd>Alt</kbd> (<kbd>Option</kbd> hoặc <kbd>⌥</kbd> trên macOS) đang hoạt động khi sự kiện bàn phím được tạo.

- {{domxref("KeyboardEvent.code")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi với giá trị mã của phím vật lý được biểu diễn bởi sự kiện.

    > [!WARNING]
    > Điều này bỏ qua bố cục bàn phím của người dùng, vì vậy nếu người dùng nhấn phím ở vị trí "Y" trong bố cục bàn phím QWERTY (gần giữa của hàng phía trên hàng home), điều này sẽ luôn trả về "KeyY", ngay cả khi người dùng có bàn phím QWERTZ (có nghĩa là người dùng mong đợi một "Z" và tất cả các thuộc tính khác sẽ cho biết một "Z") hoặc bố cục bàn phím Dvorak (nơi người dùng sẽ mong đợi một "F"). Nếu bạn muốn hiển thị các phím chính xác cho người dùng, bạn có thể sử dụng {{domxref("Keyboard.getLayoutMap()")}}.

- {{domxref("KeyboardEvent.ctrlKey")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean là `true` nếu phím <kbd>Ctrl</kbd> đang hoạt động khi sự kiện bàn phím được tạo.

- {{domxref("KeyboardEvent.isComposing")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean là `true` nếu sự kiện được kích hoạt sau `compositionstart` và trước `compositionend`.
- {{domxref("KeyboardEvent.key")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi biểu diễn giá trị phím của phím được biểu diễn bởi sự kiện.
- {{domxref("KeyboardEvent.location")}} {{ReadOnlyInline}}
  - : Trả về một số biểu diễn vị trí của phím trên bàn phím hoặc thiết bị nhập liệu khác. Danh sách các hằng số xác định vị trí được hiển thị ở trên trong [Vị trí bàn phím](#keyboard_locations).
- {{domxref("KeyboardEvent.metaKey")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean là `true` nếu phím <kbd>Meta</kbd> (trên bàn phím Mac là phím <kbd>⌘ Command</kbd>; trên bàn phím Windows là phím Windows (<kbd>⊞</kbd>)) đang hoạt động khi sự kiện bàn phím được tạo.

- {{domxref("KeyboardEvent.repeat")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean là `true` nếu phím đang được giữ xuống đến mức nó đang tự động lặp lại.
- {{domxref("KeyboardEvent.shiftKey")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean là `true` nếu phím <kbd>Shift</kbd> đang hoạt động khi sự kiện bàn phím được tạo.

### Các thuộc tính lỗi thời

- {{domxref("KeyboardEvent.charCode")}} {{Deprecated_inline}} {{ReadOnlyInline}}
  - : Trả về một số biểu diễn số tham chiếu Unicode của phím; thuộc tính này chỉ được sử dụng bởi sự kiện `keypress`. Trong Firefox 26, điều này trả về mã cho các ký tự có thể in.

- {{domxref("KeyboardEvent.keyCode")}} {{deprecated_inline}} {{ReadOnlyInline}}
  - : Trả về một số biểu diễn mã số phụ thuộc hệ thống và triển khai xác định giá trị không thay đổi của phím đã nhấn.

- {{domxref("KeyboardEvent.keyIdentifier")}} {{Non-standard_inline}} {{deprecated_inline}} {{ReadOnlyInline}}
  - : Thuộc tính này không chuẩn và đã bị loại bỏ để thay thế bằng {{domxref("KeyboardEvent.key")}}. Nó là một phần của phiên bản cũ của DOM Level 3 Events.

## Phương thức instance

_Giao diện này cũng kế thừa các phương thức từ cha của nó, {{domxref("UIEvent")}} và {{domxref("Event")}}._

- {{domxref("KeyboardEvent.getModifierState()")}}
  - : Trả về một giá trị boolean cho biết liệu phím bổ trợ như <kbd>Alt</kbd>, <kbd>Shift</kbd>, <kbd>Ctrl</kbd>, hoặc <kbd>Meta</kbd>, có được nhấn khi sự kiện được tạo hay không.

### Phương thức lỗi thời

- {{domxref("KeyboardEvent.initKeyboardEvent()")}} {{deprecated_inline}}
  - : Khởi tạo một đối tượng `KeyboardEvent`. Phương thức này hiện đã lỗi thời. Bạn nên sử dụng constructor {{domxref("KeyboardEvent.KeyboardEvent", "KeyboardEvent()")}} thay thế.

## Sự kiện

Các sự kiện sau dựa trên loại `KeyboardEvent`. Trong danh sách dưới đây, mỗi sự kiện liên kết đến tài liệu cho trình xử lý sự kiện của `Element`, áp dụng chung cho tất cả các đối tượng nhận, bao gồm {{domxref("Element")}}, {{domxref("Document")}}, và {{domxref("Window")}}.

- {{domxref("Element.keydown_event", "keydown")}}
  - : Một phím đã được nhấn.
- {{domxref("Element.keyup_event", "keyup")}}
  - : Một phím đã được nhả ra.

### Sự kiện lỗi thời

- {{domxref("Element.keypress_event", "keypress")}} {{deprecated_inline}}
  - : Một phím thường tạo ra giá trị ký tự đã được nhấn. Sự kiện này phụ thuộc nhiều vào thiết bị và đã lỗi thời. Bạn không nên sử dụng nó.

## Ghi chú sử dụng

Có ba loại sự kiện bàn phím: {{domxref("Element/keydown_event", "keydown")}}, {{domxref("Element/keypress_event", "keypress")}}, và {{domxref("Element/keyup_event", "keyup")}}. Đối với hầu hết các phím, Gecko gửi một chuỗi sự kiện bàn phím như sau:

1. Khi phím được nhấn lần đầu, sự kiện `keydown` được gửi.
2. Nếu phím không phải là phím bổ trợ, sự kiện `keypress` được gửi.
3. Khi người dùng nhả phím, sự kiện `keyup` được gửi.

### Trường hợp đặc biệt

Một số phím chuyển đổi trạng thái của đèn báo; chúng bao gồm các phím như Caps Lock, Num Lock và Scroll Lock. Trên Windows và Linux, các phím này chỉ gửi sự kiện `keydown` và `keyup`.

> [!NOTE]
> Trên Linux, Firefox 12 và các phiên bản trước đó cũng gửi sự kiện `keypress` cho các phím này.

Tuy nhiên, một hạn chế của mô hình sự kiện macOS khiến Caps Lock chỉ gửi sự kiện `keydown`. Num Lock được hỗ trợ trên một số mẫu laptop cũ hơn (các mẫu từ 2007 trở về trước), nhưng kể từ đó, macOS không còn hỗ trợ Num Lock ngay cả trên bàn phím rời. Trên các MacBook cũ có phím Num Lock, phím đó không tạo ra bất kỳ sự kiện bàn phím nào. Gecko hỗ trợ phím Scroll Lock nếu bàn phím rời có phím F14 được kết nối. Trong một số phiên bản Firefox cũ hơn, phím này tạo ra sự kiện `keypress`; hành vi không nhất quán này là [lỗi Firefox 602812](https://bugzil.la/602812).

### Xử lý tự động lặp

Khi một phím được nhấn và giữ, nó bắt đầu tự động lặp lại. Điều này dẫn đến một chuỗi sự kiện tương tự như sau được gửi:

1. `keydown`
2. `keypress`
3. `keydown`
4. `keypress`
5. <\<lặp lại cho đến khi người dùng nhả phím>>
6. `keyup`

Đây là những gì đặc tả DOM Level 3 quy định sẽ xảy ra. Tuy nhiên, có một số lưu ý, như mô tả dưới đây.

#### Tự động lặp trên một số môi trường GTK như Ubuntu 9.4

Trong một số môi trường dựa trên GTK, tự động lặp gửi một sự kiện key-up gốc tự động trong quá trình tự động lặp và không có cách nào để Gecko biết được sự khác biệt giữa một chuỗi nhấn phím lặp lại và một tự động lặp. Trên các nền tảng đó, một phím tự động lặp sẽ tạo ra chuỗi sự kiện sau:

1. `keydown`
2. `keypress`
3. `keyup`
4. `keydown`
5. `keypress`
6. `keyup`
7. <\<lặp lại cho đến khi người dùng nhả phím>>
8. `keyup`

Trong các môi trường này, thật không may, không có cách nào cho nội dung web để phân biệt giữa phím tự động lặp và phím chỉ đang được nhấn lặp lại.

## Ví dụ

```js
document.addEventListener("keydown", (event) => {
  const keyName = event.key;

  if (keyName === "Control") {
    // không alert khi chỉ nhấn phím Control.
    return;
  }

  if (event.ctrlKey) {
    // Mặc dù event.key không phải là 'Control' (ví dụ, 'a' được nhấn),
    // event.ctrlKey có thể là true nếu phím Ctrl được nhấn cùng lúc.
    alert(`Tổ hợp ctrlKey + ${keyName}`);
  } else {
    alert(`Phím đã nhấn ${keyName}`);
  }
});

document.addEventListener("keyup", (event) => {
  const keyName = event.key;

  // Khi người dùng nhả phím Ctrl, phím không còn hoạt động,
  // nên event.ctrlKey là false.
  if (keyName === "Control") {
    alert("Phím Control đã được nhả");
  }
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

Đặc tả giao diện `KeyboardEvent` đã trải qua nhiều phiên bản nháp, đầu tiên là DOM Events Level 2 nơi nó bị loại bỏ do không có sự đồng thuận, sau đó là DOM Events Level 3. Điều này dẫn đến việc triển khai các phương thức khởi tạo không chuẩn, phiên bản DOM Events Level 2 ban đầu, `KeyboardEvent.initKeyEvent()` bởi các trình duyệt Gecko và phiên bản DOM Events Level 3 ban đầu, {{domxref("KeyboardEvent.initKeyboardEvent()")}} bởi các trình duyệt khác. Cả hai đã được thay thế bằng cách sử dụng constructor hiện đại: {{domxref("KeyboardEvent.KeyboardEvent", "KeyboardEvent()")}}.

## Tương thích trình duyệt

{{Compat}}

### Ghi chú tương thích

- Bắt đầu từ Firefox 65, sự kiện `keypress` không còn được kích hoạt cho các [phím không in được](/en-US/docs/Web/API/KeyboardEvent/keyCode#non-printable_keys_function_keys) ([lỗi Firefox 968056](https://bugzil.la/968056)), ngoại trừ phím <kbd>Enter</kbd>, và các tổ hợp phím <kbd>Shift</kbd> + <kbd>Enter</kbd> và <kbd>Ctrl</kbd> + <kbd>Enter</kbd> (các tổ hợp này được giữ lại cho mục đích tương thích chéo trình duyệt).

## Xem thêm

- {{domxref("KeyboardEvent.code")}}.
- {{domxref("KeyboardEvent.key")}}.
- {{domxref("KeyboardEvent.getModifierState()")}}
