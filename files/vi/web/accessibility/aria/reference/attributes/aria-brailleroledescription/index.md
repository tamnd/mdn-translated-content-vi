---
title: "ARIA: thuộc tính aria-brailleroledescription"
short-title: aria-brailleroledescription
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-brailleroledescription
sidebar: accessibilitysidebar
---

Thuộc tính toàn cục `aria-brailleroledescription` định nghĩa một mô tả rút gọn, có thể đọc được và do tác giả bản địa hóa, cho vai trò của một phần tử, với mục đích được chuyển đổi sang Braille.

## Mô tả

Braille không phải là bản chuyển tự từng chữ cái và chữ số một, mà bao gồm nhiều dạng viết tắt, rút gọn và ký tự biểu thị từ ngữ (được gọi là logogram).

Thay vì chuyển các mô tả vai trò dài sang Braille, thuộc tính `aria-brailleroledescription` cho phép cung cấp một phiên bản rút gọn của giá trị [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription), vốn là mô tả có thể đọc được và do tác giả bản địa hóa cho vai trò của một phần tử, nhằm cải thiện trải nghiệm người dùng với giao diện Braille.

Về cơ bản, giá trị của `aria-brailleroledescription` là một phiên bản rút gọn của thuộc tính `aria-roledescription` để được chuyển đổi sang Braille.

```html
<article
  aria-roledescription="slide"
  aria-brailleroledescription="sld"
  aria-labelledby="slide1heading">
  <h1 id="slide1heading">Chào mừng đến với bài nói chuyện của tôi</h1>
  <img alt="Tôi" src="images/me.jpg" />
</article>
```

Hầu hết công nghệ hỗ trợ, như trình đọc màn hình, sẽ đọc đoạn trên là "slide, welcome to my talk. Image, Me." Các công nghệ hỗ trợ Braille sẽ hiển thị "sld welcome to my talk gra me" bằng Braille. Phần tử ngữ nghĩa {{HTMLElement('article')}} được gán vai trò "slide" bởi thuộc tính `aria-roledescription`; "slide" là một vai trò không được định nghĩa trong đặc tả, nhưng là vai trò phổ biến cho các slide trong một bài thuyết trình. Trong Braille, vai trò này được hiển thị là "sld". "gra" là viết tắt của "graphic", cách vai trò "image" được rút gọn trong Braille.

Thuộc tính `aria-brailleroledescription` chỉ nên được dùng để làm rõ mục đích của các vai trò vùng chứa không tương tác như "group" hoặc "region", hoặc để cung cấp mô tả cụ thể hơn về một widget trong ngữ cảnh Braille.

Vì thuộc tính `aria-brailleroledescription` ghi đè cách công nghệ hỗ trợ bản địa hóa và biểu đạt tên của vai trò trong Braille, các giá trị không phù hợp sẽ khiến người dùng không hiểu hoặc không thể tương tác với phần tử trên giao diện Braille.

Chỉ dùng `aria-brailleroledescription` nếu [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription) hiện diện. Tuy nhiên, nếu giá trị `aria-roledescription` đã hoạt động tốt trong Braille, thì không cần phiên bản Braille của thuộc tính đó. Nói chung, `aria-brailleroledescription` chỉ nên được dùng trong trường hợp hiếm hoi khi `aria-roledescription` quá dài dòng đối với Braille.

Một vài quy tắc cần nhớ:

- Chỉ áp dụng `aria-brailleroledescription` cho các phần tử có vai trò ARIA hợp lệ hoặc các phần tử có ngữ nghĩa vai trò ngầm định.
- `aria-brailleroledescription`, nếu có, phải có giá trị không rỗng, không null và khác với giá trị `aria-roledescription`, vốn lại phải khác với vai trò tường minh của ARIA hoặc vai trò ngữ nghĩa ngầm định.
- Tránh dùng các mẫu Braille Unicode. Nếu bắt buộc phải dùng, hãy bảo đảm giá trị `aria-brailleroledescription` có nội dung khác với các mẫu Braille Unicode, khoảng trắng, và chấm Braille 0.
- Bảo đảm giá trị luôn được bản địa hóa theo ngôn ngữ của tài liệu.

> [!WARNING]
> Nếu nội dung chỉ là các mẫu Braille Unicode, giá trị đó sẽ không được dịch theo bảng dịch ưa thích của người dùng.

> [!NOTE]
> KHÔNG dùng `aria-brailleroledescription` để sao chép `aria-roledescription`. Chỉ bao gồm thuộc tính này khi `aria-roledescription` không cung cấp biểu diễn Braille phù hợp.

Giá trị `aria-brailleroledescription` sẽ không được hiển thị cho người dùng Braille nếu:

- Giá trị rỗng hoặc chỉ chứa các ký tự khoảng trắng hoặc mẫu Braille rỗng: chấm-0 (U+2800).
- Phần tử mà thuộc tính được áp dụng có vai trò WAI-ARIA tường minh hoặc ngầm định mà `aria-brailleroledescription` bị cấm, bao gồm vai trò `generic`.
- Phần tử mà thuộc tính được áp dụng không có `aria-roledescription` hợp lệ.

> [!NOTE]
> Hãy kiểm thử trang web và ứng dụng của bạn với người dùng thực sự sử dụng công nghệ hỗ trợ, bao gồm cả trình đọc Braille, để bảo đảm nội dung của bạn có ý nghĩa trong Braille.

## Giá trị

- `<string>`
  - : Giá trị là một chuỗi, một kiểu giá trị không bị ràng buộc, dự định được chuyển đổi sang Braille

## Vai trò liên quan

Được dùng trong **TẤT CẢ** vai trò (trừ [`generic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role)).

## Đặc tả

{{Specifications}}

## Xem thêm

- {{domxref("Element.ariaBrailleRoleDescription")}}
- [`aria-roledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription).
- [`Element.ariaRoleDescription`](/en-US/docs/Web/API/Element/ariaRoleDescription)
