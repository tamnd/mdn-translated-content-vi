---
title: Biểu mẫu HTML trong trình duyệt cũ
short-title: Forms in legacy browsers
slug: Learn_web_development/Extensions/Forms/HTML_forms_in_legacy_browsers
page-type: guide
sidebar: learnsidebar
---

Tất cả các nhà phát triển web học rất nhanh (và đôi khi đau đớn) rằng Web là một nơi rất khắc nghiệt đối với họ. Rủi ro tệ nhất của chúng ta là trình duyệt cũ. Điều này từng có nghĩa là "Internet Explorer", nhưng có hàng triệu người sử dụng các thiết bị cũ, đặc biệt là điện thoại di động, nơi mà cả trình duyệt lẫn hệ điều hành đều không thể cập nhật được.

Đối phó với môi trường này là một phần của công việc. May mắn thay, có một vài mẹo để biết có thể giúp bạn giải quyết hầu hết các vấn đề do trình duyệt cũ gây ra. Nếu một trình duyệt không hỗ trợ một loại {{htmlelement('input')}} HTML, nó không thất bại: nó chỉ sử dụng giá trị mặc định của `type=text`.

## Tìm hiểu về các vấn đề

Để hiểu các mẫu phổ biến, việc đọc tài liệu hướng dẫn sẽ có ích. Nếu bạn đang đọc bài này trên [MDN](/), bạn đang ở đúng nơi để bắt đầu. Chỉ cần kiểm tra hỗ trợ của các phần tử (hoặc giao diện DOM) mà bạn muốn sử dụng. MDN có bảng tương thích có sẵn cho hầu hết các phần tử, thuộc tính và API có thể được sử dụng trong trang web.

Vì [biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms) liên quan đến sự tương tác phức tạp, có một quy tắc quan trọng: hãy giữ đơn giản, còn được gọi là "[nguyên tắc KISS](https://en.wikipedia.org/wiki/KISS_principle)". Có rất nhiều trường hợp chúng ta muốn các biểu mẫu "đẹp hơn" hoặc "có chức năng nâng cao", nhưng xây dựng biểu mẫu HTML hiệu quả không phải là vấn đề thiết kế hay công nghệ. Đó là về sự đơn giản, trực quan và dễ dàng tương tác của người dùng. Hướng dẫn, [tính khả dụng của biểu mẫu trên UX For The Masses,](https://www.uxforthemasses.com/forms-usability/) giải thích điều này rõ ràng.

### Giảm cấp nhẹ nhàng là người bạn tốt nhất của nhà phát triển web

[Giảm cấp nhẹ nhàng và cải tiến dần dần](https://www.sitepoint.com/progressive-enhancement-graceful-degradation-choice/) là các mẫu phát triển cho phép bạn xây dựng những thứ tuyệt vời bằng cách hỗ trợ nhiều trình duyệt cùng một lúc. Khi bạn xây dựng thứ gì đó cho một trình duyệt hiện đại, và bạn muốn chắc chắn rằng nó sẽ hoạt động, theo cách này hay cách khác, trên các trình duyệt cũ, bạn đang thực hiện giảm cấp nhẹ nhàng.

Hãy xem một số ví dụ liên quan đến biểu mẫu HTML.

#### Các loại đầu vào HTML

Tất cả các loại đầu vào HTML đều có thể sử dụng được trong tất cả các trình duyệt, ngay cả những cái cổ, vì cách chúng giảm cấp là rất dự đoán được. Nếu một trình duyệt không biết giá trị của thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) của phần tử {{HTMLElement("input")}}, nó sẽ dự phòng như thể giá trị là `text`.

```html
<label for="myColor">
  Pick a color
  <input type="color" id="myColor" name="color" />
</label>
```

<table class="no-markdown">
  <thead>
    <tr>
      <th>Supported</th>
      <th>Not supported</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <img
          alt="Screen shot of the color input on Chrome for macOS"
          src="color-fallback-chrome.png"
        />
      </td>
      <td>
        <img
          alt="Screen shot of the color input on Firefox for macOS"
          src="color-fallback-firefox.png"
        />
      </td>
    </tr>
  </tbody>
</table>

#### Nút biểu mẫu

Có hai cách để định nghĩa nút trong biểu mẫu HTML:

- Phần tử {{HTMLElement("input")}} với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành các giá trị `button`, `submit`, `reset` hoặc `image`
- Phần tử {{HTMLElement("button")}}

##### {{HTMLElement("input")}}

Phần tử {{HTMLElement("input")}} có thể làm mọi thứ trở nên khó khăn một chút nếu bạn muốn áp dụng một số CSS bằng cách sử dụng bộ chọn phần tử:

```html
<input type="button" value="click me" />
```

Nếu chúng ta xóa đường viền trên tất cả các đầu vào, chúng ta có thể khôi phục giao diện mặc định cho các nút đầu vào chỉ bằng giá trị CSS toàn cục {{cssxref('revert')}}.

```css
input {
  /* This rule turns off the default rendering for the input types that have a border,
     including buttons defined with an input element */
  border: 1px solid #cccccc;
}
input[type="button"] {
  /* Revert the last border declaration */
  border: revert;
}
```

### Giới hạn tạo kiểu trong trình duyệt cũ

Một trong những vấn đề lớn với biểu mẫu HTML trong trình duyệt cũ là tạo kiểu cho chúng bằng CSS. Như đã đề cập ở nơi khác, bạn có thể khai báo {{cssxref('appearance', 'appearance: none;')}} để xóa các kiểu mặc định và xây dựng kiểu của riêng mình trên đó. Tuy nhiên, các trình duyệt cũ ít có khả năng hỗ trợ các kỹ thuật tạo kiểu được đề cập trước đó trong mô-đun hơn so với các trình duyệt hiện đại. Có thể tốt hơn là chỉ để lại điều khiển biểu mẫu không được tạo kiểu trong các trình duyệt cũ, nếu bạn cần hỗ trợ chúng. Xem phần tiếp theo để biết lời khuyên về việc phát hiện hỗ trợ cho các loại đầu vào cụ thể.

Nếu bạn phải thay đổi các kiểu mặc định của các tiện ích biểu mẫu của mình trong trình duyệt cũ, hãy xác định hướng dẫn kiểu để đảm bảo tính nhất quán giữa tất cả các điều khiển biểu mẫu của bạn để trải nghiệm người dùng không bị phá hủy. Bạn cũng có thể điều tra một số kỹ thuật khó như [xây dựng lại tiện ích với JavaScript](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls), nhưng nó có thể gây rắc rối hơn giá trị của nó.

## Phát hiện tính năng và polyfill

CSS và JavaScript là các công nghệ tuyệt vời, nhưng điều quan trọng là đảm bảo bạn không phá vỡ các trình duyệt cũ. Trước khi sử dụng các tính năng không được hỗ trợ đầy đủ trong các trình duyệt bạn đang nhắm mục tiêu, bạn nên phát hiện tính năng.

### Phát hiện tính năng CSS

Trước khi tạo kiểu cho một điều khiển biểu mẫu được thay thế, bạn có thể kiểm tra xem trình duyệt có hỗ trợ các tính năng bạn dự định sử dụng {{cssxref('@supports')}} hay không:

```css
@supports (appearance: none) {
  input[type="search"] {
    appearance: none;
    /* restyle the search input */
  }
}
```

Thuộc tính {{cssxref('appearance')}} có thể được sử dụng để hiển thị một phần tử sử dụng kiểu dáng gốc của nền tảng, hoặc, như được thực hiện với giá trị `none`, xóa kiểu dáng gốc của nền tảng mặc định.

### Phát hiện đầu vào biểu mẫu JavaScript

Bạn có thể sử dụng JavaScript để phát hiện xem một loại đầu vào cụ thể có được hỗ trợ hay không. Điều này dựa trên thực tế chúng ta đã đề cập trước đây — mọi loại đầu vào đều dự phòng về `<input type="text">` trong các trình duyệt không hỗ trợ.

Xác định một hàm kiểm tra. Dòng đầu tiên của thân hàm nên tạo phần tử `<input>` kiểm tra. Tiếp theo, đặt thuộc tính `type` của nó thành loại bạn muốn kiểm tra. Cuối cùng, kiểm tra giá trị thuộc tính `type`. Trong các trình duyệt không hỗ trợ loại đầu vào đó, dòng cuối cùng sẽ không có tác dụng và `type` sẽ được trả về là `text`. Trong dòng bên dưới, chúng ta đang đảo ngược giá trị trả về bằng cách sử dụng toán tử phủ định (`!`) vì nếu `type` không phải là `text`, thì loại đó được hỗ trợ, vì vậy chúng ta muốn trả về `true`. Hàm hoàn chỉnh trông như sau:

```js
function testDatetimeLocalSupport() {
  const testInput = document.createElement("input");
  testInput.setAttribute("type", "datetime-local");
  return testInput.type !== "text";
}
```

Ví dụ trên cho thấy ý tưởng cơ bản đằng sau các bài kiểm tra như vậy. Thay vì tự phát minh lại bánh xe, tuy nhiên, bạn nên sử dụng thư viện phát hiện tính năng để xử lý các bài kiểm tra như vậy.

Dựa trên kết quả của bài kiểm tra đó, ví dụ bạn có thể chọn sử dụng JavaScript để xây dựng bản thay thế tùy chỉnh cho loại không được hỗ trợ, hoặc không áp dụng bảng kiểu tạo kiểu cho loại không được hỗ trợ vì bạn muốn cung cấp các kiểu mặc định đơn giản cho các trình duyệt cũ.

### JavaScript không gây phiền nhiễu

Một trong những vấn đề lớn nhất là tính khả dụng của API. Vì lý do đó, được coi là thực hành tốt nhất khi làm việc với JavaScript "không gây phiền nhiễu". Đó là một mẫu phát triển xác định hai yêu cầu:

- Sự tách biệt nghiêm ngặt giữa cấu trúc và hành vi.
- Nếu mã bị hỏng, nội dung và các chức năng cơ bản phải vẫn có thể truy cập và sử dụng được.

[Các nguyên tắc của JavaScript không gây phiền nhiễu](https://www.w3.org/wiki/The_principles_of_unobtrusive_JavaScript) (ban đầu được viết bởi Peter-Paul Koch cho dev.opera.com) mô tả những ý tưởng này rất rõ ràng.

### Chú ý đến hiệu suất

Mặc dù một số polyfill rất chú ý đến hiệu suất, việc tải các script bổ sung có thể ảnh hưởng đến hiệu suất của ứng dụng của bạn. Điều này đặc biệt quan trọng với các trình duyệt cũ; nhiều trong số chúng có công cụ JavaScript rất chậm có thể làm cho việc thực thi tất cả các polyfill của bạn trở nên đau đớn cho người dùng. Hiệu suất là một chủ đề riêng, nhưng các trình duyệt cũ rất nhạy cảm với nó: về cơ bản, chúng chậm và chúng càng cần nhiều polyfill, chúng càng phải xử lý nhiều JavaScript hơn. Vì vậy, chúng bị gánh nặng gấp đôi so với các trình duyệt hiện đại. Hãy kiểm tra mã của bạn với các trình duyệt cũ để xem chúng thực sự hoạt động như thế nào. Đôi khi, việc bỏ một số chức năng dẫn đến trải nghiệm người dùng tốt hơn so với việc có đúng chức năng đó trong tất cả các trình duyệt. Như một lời nhắc nhở cuối cùng, hãy luôn nghĩ về người dùng cuối.

## Kết luận

Như bạn có thể thấy, việc xem xét giao diện mặc định của điều khiển biểu mẫu của trình duyệt và hệ điều hành là quan trọng. Có nhiều kỹ thuật để xử lý các vấn đề này; tuy nhiên, việc thành thạo tất cả chúng vượt quá phạm vi của bài viết này. Tiền đề cơ bản là xem xét liệu việc thay đổi triển khai mặc định có xứng đáng với công sức trước khi bắt đầu thử thách hay không.

Nếu bạn đọc tất cả các bài viết của [hướng dẫn Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms) này, bây giờ bạn nên cảm thấy thoải mái với việc sử dụng biểu mẫu. Nếu bạn khám phá ra các kỹ thuật hoặc gợi ý mới, xin hãy giúp cải thiện hướng dẫn.
