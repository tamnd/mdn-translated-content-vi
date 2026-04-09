---
title: "ARIA: vai trò dialog"
short-title: dialog
slug: Web/Accessibility/ARIA/Reference/Roles/dialog_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#dialog
  - https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/examples/dialog/
sidebar: accessibilitysidebar
---

Vai trò `dialog` được dùng để đánh dấu một hộp thoại hoặc cửa sổ dựa trên HTML, tách nội dung hoặc giao diện người dùng ra khỏi phần còn lại của ứng dụng web hoặc trang. Hộp thoại thường được đặt lên trên phần còn lại của nội dung trang bằng một lớp phủ. Hộp thoại có thể không phải modal (vẫn có thể tương tác với nội dung bên ngoài hộp thoại) hoặc modal (chỉ có thể tương tác với nội dung trong hộp thoại).

```html
<div
  role="dialog"
  aria-labelledby="dialog1Title"
  aria-describedby="dialog1Desc">
  <h2 id="dialog1Title">
    Thông tin cá nhân của bạn đã được cập nhật thành công
  </h2>
  <p id="dialog1Desc">
    Bạn có thể thay đổi thông tin bất cứ lúc nào trong phần tài khoản người
    dùng.
  </p>
  <button>Đóng</button>
</div>
```

## Mô tả

Một dialog là một cửa sổ con của cửa sổ chính của một ứng dụng web. Đối với các trang HTML, cửa sổ ứng dụng chính là toàn bộ tài liệu web, tức là phần tử body.

Việc đánh dấu một phần tử dialog bằng vai trò `dialog` giúp công nghệ hỗ trợ nhận biết nội dung của hộp thoại là một nhóm riêng biệt và tách khỏi phần còn lại của nội dung trang. Tuy nhiên, chỉ thêm `role="dialog"` là chưa đủ để làm cho một hộp thoại có thể truy cập được. Ngoài ra, cần làm thêm những việc sau:

- Hộp thoại phải được gắn nhãn đúng cách
- Tiêu điểm bàn phím phải được quản lý đúng cách

Các phần dưới đây mô tả cách đáp ứng hai yêu cầu này.

### Gắn nhãn

Mặc dù hộp thoại bản thân không bắt buộc phải có thể nhận tiêu điểm, nó vẫn cần có nhãn. Nhãn của hộp thoại sẽ cung cấp thông tin ngữ cảnh cho các điều khiển tương tác bên trong hộp thoại. Nói cách khác, nhãn của hộp thoại hoạt động như nhãn nhóm cho các điều khiển bên trong nó, tương tự như cách phần tử `<legend>` cung cấp nhãn nhóm cho các điều khiển bên trong phần tử `<fieldset>`.

Nếu hộp thoại đã có thanh tiêu đề hiển thị, văn bản trong thanh đó có thể được dùng để gắn nhãn cho chính hộp thoại. Cách tốt nhất để làm điều này là dùng thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) cho phần tử `role="dialog"`. Ngoài ra, nếu hộp thoại có văn bản mô tả bổ sung ngoài tiêu đề hộp thoại, văn bản này có thể được liên kết với hộp thoại bằng thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby). Cách tiếp cận này được minh họa trong đoạn mã bên dưới:

```html
<div
  role="dialog"
  aria-labelledby="dialog1Title"
  aria-describedby="dialog1Desc">
  <h2 id="dialog1Title">
    Thông tin cá nhân của bạn đã được cập nhật thành công
  </h2>
  <p id="dialog1Desc">
    Bạn có thể thay đổi thông tin bất cứ lúc nào trong phần tài khoản người
    dùng.
  </p>
  <button>Đóng</button>
</div>
```

> [!NOTE]
> Hãy nhớ rằng tiêu đề và văn bản mô tả của hộp thoại không cần phải có thể nhận tiêu điểm thì trình đọc màn hình ở chế độ không ảo vẫn có thể nhận biết chúng. Kết hợp giữa vai trò dialog của ARIA và các kỹ thuật gắn nhãn sẽ khiến trình đọc màn hình đọc thông tin của hộp thoại khi tiêu điểm được chuyển vào đó.

### Các tính năng JavaScript bắt buộc

#### Quản lý tiêu điểm

Một hộp thoại có những yêu cầu riêng về cách quản lý tiêu điểm bàn phím:

- Hộp thoại luôn phải có ít nhất một điều khiển có thể nhận tiêu điểm. Với nhiều hộp thoại, sẽ có một nút như "Đóng", "OK" hoặc "Hủy". Ngoài điều khiển cần thiết đó, hộp thoại có thể chứa bất kỳ số lượng phần tử có thể nhận tiêu điểm nào, kể cả toàn bộ biểu mẫu hoặc các widget vùng chứa khác như tab.
- Khi hộp thoại xuất hiện trên màn hình, tiêu điểm bàn phím (phụ thuộc vào mục đích của hộp thoại) nên được chuyển đến điều khiển mặc định có thể nhận tiêu điểm bên trong hộp thoại. Với hộp thoại chỉ cung cấp một thông điệp cơ bản, đó có thể là nút "OK". Với hộp thoại chứa biểu mẫu, đó có thể là trường đầu tiên trong biểu mẫu.
- Sau khi hộp thoại bị đóng, tiêu điểm bàn phím nên được chuyển trở lại vị trí trước khi nó được đưa vào hộp thoại. Nếu không, tiêu điểm có thể bị rơi về đầu trang.
- Với hầu hết hộp thoại, hành vi mong đợi là thứ tự tab của hộp thoại sẽ _quay vòng_, nghĩa là khi người dùng tab qua các phần tử có thể nhận tiêu điểm trong hộp thoại, phần tử có thể nhận tiêu điểm đầu tiên sẽ được focus sau khi đi qua phần tử cuối cùng. Nói cách khác, thứ tự tab phải được giữ bên trong hộp thoại và do hộp thoại quản lý.
- Nếu hộp thoại có thể di chuyển hoặc thay đổi kích thước, hãy bảo đảm các hành động này cũng có thể thực hiện được bằng bàn phím, không chỉ bằng chuột. Tương tự, nếu hộp thoại có các tính năng đặc biệt như thanh công cụ hoặc menu ngữ cảnh, các tính năng đó cũng phải có thể truy cập và thao tác bằng bàn phím.
- Hộp thoại có thể là modal hoặc không modal. Khi một hộp thoại _modal_ xuất hiện trên màn hình, không thể tương tác với bất kỳ nội dung trang nào bên ngoài hộp thoại. Nói cách khác, giao diện ứng dụng chính hoặc nội dung trang được xem là tạm thời bị vô hiệu hóa trong thời gian hộp thoại modal đang hiển thị. Với hộp thoại _không modal_, vẫn có thể tương tác với nội dung bên ngoài hộp thoại trong khi hộp thoại đang hiển thị. Lưu ý rằng với hộp thoại không modal sẽ cần một phím tắt toàn cục cho phép chuyển tiêu điểm giữa các hộp thoại đã mở và trang chính.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Dùng thuộc tính này để gắn nhãn cho hộp thoại. Thường thì giá trị của `aria-labelledby` sẽ là ID của phần tử dùng để đặt tiêu đề cho hộp thoại.
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
  - : Dùng thuộc tính này để mô tả nội dung của hộp thoại.

### Các tác động có thể có lên user agent và công nghệ hỗ trợ

Khi dùng vai trò `dialog`, user agent nên làm như sau:

- Hiển thị phần tử như một hộp thoại trong API trợ năng của hệ điều hành.

Khi hộp thoại được gắn nhãn đúng cách và tiêu điểm được chuyển đến một phần tử bên trong hộp thoại, trình đọc màn hình nên đọc vai trò, tên và tùy chọn mô tả truy cập của hộp thoại, cùng với phần tử đang được focus.

> [!NOTE]
> Quan điểm về cách công nghệ hỗ trợ nên xử lý kỹ thuật này có thể khác nhau, và thứ tự đọc có thể thay đổi tùy theo công nghệ hỗ trợ được dùng. Thông tin ở trên là một trong những quan điểm đó và có thể thay đổi khi đặc tả được hoàn thiện.

## Ví dụ

### Một hộp thoại chứa biểu mẫu

```html
<div
  role="dialog"
  aria-labelledby="dialog1Title"
  aria-describedby="dialog1Desc">
  <h2 id="dialog1Title">Biểu mẫu đăng ký</h2>
  <p id="dialog1Desc">
    Chúng tôi sẽ không chia sẻ thông tin này với bên thứ ba.
  </p>
  <form>
    <p>
      <label for="firstName">Tên</label>
      <input id="firstName" type="text" />
    </p>
    <p>
      <label for="lastName">Họ</label>
      <input id="lastName" type="text" />
    </p>
    <p>
      <label for="interests">Sở thích</label>
      <textarea id="interests"></textarea>
    </p>
    <p>
      <input type="checkbox" id="autoLogin" name="autoLogin" />
      <label for="autoLogin">Đăng nhập tự động?</label>
    </p>
    <p>
      <input type="submit" value="Lưu thông tin" />
    </p>
  </form>
</div>
```

#### Ví dụ hoạt động

- [jQuery-UI Dialog](https://jqueryui.com/dialog/)

### Ghi chú

> [!NOTE]
> Mặc dù có thể ngăn người dùng bàn phím chuyển tiêu điểm tới các phần tử bên ngoài hộp thoại, người dùng trình đọc màn hình vẫn có thể đi tới nội dung đó bằng con trỏ ảo của trình đọc màn hình.
> Điều quan trọng là nhà phát triển phải bảo đảm nội dung bên ngoài hộp thoại modal không thể truy cập được với mọi người dùng trong khi hộp thoại modal đang hoạt động.

## Đặc tả

{{Specifications}}

## Xem thêm

- [vai trò `alertdialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role)
- {{HTMLElement('dialog', 'Phần tử HTML <code>&lt;dialog&gt;</code>')}}
