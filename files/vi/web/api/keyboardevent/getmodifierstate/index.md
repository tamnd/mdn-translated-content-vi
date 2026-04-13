---
title: "KeyboardEvent: phương thức getModifierState()"
short-title: getModifierState()
slug: Web/API/KeyboardEvent/getModifierState
page-type: web-api-instance-method
browser-compat: api.KeyboardEvent.getModifierState
---

{{APIRef("UI Events")}}

Phương thức **`KeyboardEvent.getModifierState()`** trả về
trạng thái hiện tại của phím bổ trợ được chỉ định: `true` nếu bổ trợ đang hoạt động
(phím bổ trợ đang được nhấn hoặc khóa), ngược lại là `false`.

## Cú pháp

```js-nolint
getModifierState(key)
```

### Tham số

- `key`
  - : Một giá trị phím bổ trợ. Giá trị phải là một trong các giá trị {{domxref("KeyboardEvent.key")}}
    biểu diễn phím bổ trợ, hoặc chuỗi `"Accel"`
    {{deprecated_inline}}. Phân biệt chữ hoa chữ thường.

### Giá trị trả về

Một boolean.

## Phím bổ trợ trên Firefox

Khi nào `getModifierState()` trả về true trên Firefox?

<table class="standard-table">
  <thead>
    <tr>
      <th scope="row"></th>
      <th scope="col">Windows</th>
      <th scope="col">Linux (GTK)</th>
      <th scope="col">Mac</th>
      <th scope="col">Android 2.3</th>
      <th scope="col">Android 3.0 trở lên</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row"><code>"Alt"</code></th>
      <td>Phím <kbd>Alt</kbd> hoặc phím <kbd>AltGr</kbd> được nhấn</td>
      <td>Phím <kbd>Alt</kbd> được nhấn</td>
      <td>Phím <kbd>⌥ Option</kbd> được nhấn</td>
      <td colspan="2">Phím <kbd>Alt</kbd> hoặc phím <kbd>option</kbd> được nhấn</td>
    </tr>
    <tr>
      <th scope="row"><code>"AltGraph"</code></th>
      <td>
        <p>
          Cả hai phím <kbd>Alt</kbd> và <kbd>Ctrl</kbd> đều được nhấn, hoặc
          phím <kbd>AltGr</kbd> được nhấn
        </p>
      </td>
      <td>
        Phím <kbd>Level 3 Shift</kbd> (hoặc phím <kbd>Level 5 Shift</kbd>) được nhấn
      </td>
      <td>Phím <kbd>⌥ Option</kbd> được nhấn</td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
    </tr>
    <tr>
      <th scope="row"><code>"CapsLock"</code></th>
      <td colspan="3">Trong khi đèn LED của <kbd>⇪ Caps Lock</kbd> sáng</td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>Trong khi <kbd>CapsLock</kbd> được khóa</td>
    </tr>
    <tr>
      <th scope="row"><code>"Control"</code></th>
      <td>Phím <kbd>Ctrl</kbd> hoặc phím <kbd>AltGr</kbd> được nhấn</td>
      <td>Phím <kbd>Ctrl</kbd> được nhấn</td>
      <td>Phím <kbd>control</kbd> được nhấn</td>
      <td>Phím <kbd>menu</kbd> được nhấn.</td>
      <td>
        Phím <kbd>Ctrl</kbd>, phím <kbd>control</kbd> hoặc phím <kbd>menu</kbd>
        được nhấn.
      </td>
    </tr>
    <tr>
      <th scope="row"><code>"Fn"</code></th>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>
        Phím <kbd>Function</kbd> được nhấn, nhưng chúng tôi không chắc phím nào làm
        cho trạng thái bổ trợ hoạt động. Phím <kbd>Fn</kbd> trên bàn phím Mac không
        gây ra trạng thái này hoạt động.
      </td>
    </tr>
    <tr>
      <th scope="row"><code>"FnLock"</code></th>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
    </tr>
    <tr>
      <th scope="row"><code>"Hyper"</code></th>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
    </tr>
    <tr>
      <th scope="row"><code>"Meta"</code></th>
      <td>Phím <kbd>⊞ Windows Logo</kbd> được nhấn (từ Firefox 118)</td>
      <td>Phím <kbd>Meta</kbd> được nhấn</td>
      <td>Phím <kbd>⌘ Command</kbd> được nhấn</td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>Phím <kbd>⊞ Windows Logo</kbd> hoặc phím <kbd>command</kbd> được nhấn</td>
    </tr>
    <tr>
      <th scope="row"><code>"NumLock"</code></th>
      <td colspan="2">Trong khi đèn LED của <kbd>Num Lock</kbd> sáng</td>
      <td>Một phím trên bàn phím số được nhấn</td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>Trong khi <kbd>NumLock</kbd> được khóa</td>
    </tr>
    <tr>
      <th scope="row"><code>"OS"</code></th>
      <td>Phím <kbd>⊞ Windows Logo</kbd> được nhấn (trước Firefox 118)</td>
      <td>
        Phím <kbd>Super</kbd> hoặc phím <kbd>Hyper</kbd> được nhấn (thường được ánh xạ
        thành phím <kbd>⊞ Windows Logo</kbd>)
      </td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
    </tr>
    <tr>
      <th scope="row"><code>"ScrollLock"</code></th>
      <td>Trong khi đèn LED của <kbd>Scroll Lock</kbd> sáng</td>
      <td>
        Trong khi đèn LED của <kbd>Scroll Lock</kbd> sáng, nhưng thường điều này
        không được nền tảng hỗ trợ
      </td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>Trong khi <kbd>ScrollLock</kbd> được khóa</td>
    </tr>
    <tr>
      <th scope="row"><code>"Shift"</code></th>
      <td colspan="5">Phím <kbd>⇧ Shift</kbd> được nhấn</td>
    </tr>
    <tr>
      <th scope="row"><code>"Super"</code></th>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
    </tr>
    <tr>
      <th scope="row"><code>"Symbol"</code></th>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
    </tr>
    <tr>
      <th scope="row"><code>"SymbolLock"</code></th>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
      <td>❌ <em>Không hỗ trợ</em></td>
    </tr>
  </tbody>
</table>

- Trên các nền tảng khác, "Alt", "Control" và "Shift" có thể được hỗ trợ.
- Tất cả các bổ trợ (ngoại trừ `"FnLock"`, `"Hyper"`, `"Super"` và `"Symbol"` được định nghĩa sau khi Firefox triển khai tính năng này) luôn được hỗ trợ cho các sự kiện không đáng tin cậy trên Firefox.
  Điều này không phụ thuộc vào nền tảng.

## Bổ trợ ảo `"Accel"`

> [!NOTE]
> Bổ trợ ảo `"Accel"` đã
> bị **loại bỏ** hiệu quả trong các bản nháp hiện tại của đặc tả DOM3 Events.

`getModifierState()` cũng chấp nhận một bổ trợ ảo đã loại bỏ có tên là
`"Accel"`. `event.getModifierState("Accel")` trả về
`true` khi ít nhất một trong hai {{domxref("KeyboardEvent.ctrlKey")}} hoặc
{{domxref("KeyboardEvent.metaKey")}} là `true`.

Trong các triển khai cũ và các đặc tả đã lỗi thời, nó trả về `true` khi
một bổ trợ là phím bổ trợ điển hình cho phím tắt được nhấn. Ví
dụ, trên Windows, nhấn phím <kbd>Ctrl</kbd> có thể khiến nó trả về `true`.
Tuy nhiên, trên Mac, nhấn phím <kbd>⌘ Command</kbd> có thể khiến nó trả về `true`.
Lưu ý rằng phím bổ trợ nào khiến nó trả về true phụ thuộc vào nền tảng, trình duyệt, và
cài đặt người dùng. Ví dụ, người dùng Firefox có thể tùy chỉnh điều này bằng một pref,
`"ui.key.accelKey"`.

## Ví dụ

```js
function handleKeyboardEvent(event) {
  // Bỏ qua nếu các bổ trợ sau đang hoạt động.
  if (
    event.getModifierState("Fn") ||
    event.getModifierState("Hyper") ||
    event.getModifierState("OS") ||
    event.getModifierState("Super") ||
    event.getModifierState("Win") /* hack cho IE */
  ) {
    return;
  }

  // Cũng bỏ qua nếu hai hoặc nhiều bổ trợ ngoại trừ Shift đang hoạt động.
  if (
    event.getModifierState("Control") +
      event.getModifierState("Alt") +
      event.getModifierState("Meta") >
    1
  ) {
    return;
  }

  // Xử lý phím tắt với bổ trợ tiêu chuẩn
  if (event.getModifierState("Accel")) {
    switch (event.key.toLowerCase()) {
      case "c":
        if (event.getModifierState("Shift")) {
          // Xử lý Accel + Shift + C
          event.preventDefault(); // tiêu thụ sự kiện phím
        }
        break;
      case "k":
        if (!event.getModifierState("Shift")) {
          // Xử lý Accel + K
          event.preventDefault(); // tiêu thụ sự kiện phím
        }
        break;
    }
    return;
  }

  // Thực hiện hành động khác cho các phím mũi tên nếu ScrollLock được khóa.
  if (
    (event.getModifierState("ScrollLock") ||
      event.getModifierState("Scroll")) /* hack cho IE */ &&
    !event.getModifierState("Control") &&
    !event.getModifierState("Alt") &&
    !event.getModifierState("Meta")
  ) {
    switch (event.key) {
      case "ArrowDown":
      case "Down": // hack cho IE và Firefox cũ
        event.preventDefault(); // tiêu thụ sự kiện phím
        break;
      case "ArrowLeft":
      case "Left": // hack cho IE và Firefox cũ
        // Thực hiện hành động khác nếu ScrollLock được khóa.
        event.preventDefault(); // tiêu thụ sự kiện phím
        break;
      case "ArrowRight":
      case "Right": // hack cho IE và Firefox cũ
        // Thực hiện hành động khác nếu ScrollLock được khóa.
        event.preventDefault(); // tiêu thụ sự kiện phím
        break;
      case "ArrowUp":
      case "Up": // hack cho IE và Firefox cũ
        // Thực hiện hành động khác nếu ScrollLock được khóa.
        event.preventDefault(); // tiêu thụ sự kiện phím
        break;
    }
  }
}
```

> [!NOTE]
> Mặc dù ví dụ này sử dụng `.getModifierState()` với `"Alt"`,
> `"Control"`, `"Meta"` và `"Shift"`, việc sử dụng
> `event.altKey`, `event.ctrlKey`, `event.metaKey` và
> `event.shiftKey` có thể được ưu tiên hơn.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("KeyboardEvent")}} mà phương thức này thuộc về.
- {{domxref("MouseEvent.getModifierState")}}
