---
title: Các tầng tầng
slug: Learn_web_development/Core/Styling_basics/Cascade_layers
page-type: learn-module-chapter
sidebar: learnsidebar
---

Bài học này nhằm giới thiệu cho bạn về [cascade layers](/en-US/docs/Web/CSS/Reference/At-rules/@layer), một tính năng nâng cao hơn được xây dựng trên các khái niệm cơ bản của [CSS cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) và [CSS specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity).

Nếu bạn mới làm quen với CSS, việc học qua bài học này có thể có vẻ ít liên quan ngay lập tức và hơi mang tính học thuật hơn so với một số phần khác của khóa học. Tuy nhiên, biết những điều cơ bản về cascade layers là gì khi bạn gặp chúng trong các dự án của mình là hữu ích. Bạn càng làm việc nhiều với CSS, việc hiểu cascade layers và biết cách tận dụng sức mạnh của chúng sẽ giúp bạn tránh được rất nhiều đau đớn trong việc quản lý codebase với CSS từ các bên khác nhau, plugin, và nhóm phát triển.

Cascade layers phù hợp nhất khi bạn làm việc với CSS từ nhiều nguồn khi có các bộ chọn CSS xung đột và các độ đặc hiệu cạnh tranh, hoặc khi bạn đang xem xét việc sử dụng {{cssxref("important", "!important")}}.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Ý tưởng về cách CSS hoạt động, bao gồm cascade và độ đặc hiệu (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts">Xử lý xung đột</a>).
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Học cách cascade layers hoạt động.
      </td>
    </tr>
  </tbody>
</table>

Đối với mỗi thuộc tính CSS được áp dụng cho một phần tử, chỉ có thể có một giá trị. Bạn có thể xem tất cả các giá trị thuộc tính được áp dụng cho một phần tử bằng cách kiểm tra phần tử trong công cụ phát triển của trình duyệt. Bảng "Styles" của công cụ hiển thị tất cả các giá trị thuộc tính được áp dụng cho phần tử đang được kiểm tra, cùng với bộ chọn khớp và tệp nguồn CSS. Bộ chọn từ nguồn gốc có ưu tiên có các giá trị của nó được áp dụng cho phần tử khớp.

Ngoài các kiểu được áp dụng, bảng Styles hiển thị các giá trị bị gạch chân đã khớp với phần tử được chọn nhưng không được áp dụng do cascade, độ đặc hiệu, hoặc thứ tự nguồn. Các kiểu bị gạch chân có thể đến từ cùng nguồn gốc có ưu tiên nhưng có độ đặc hiệu thấp hơn, hoặc với nguồn gốc và độ đặc hiệu khớp, nhưng được tìm thấy sớm hơn trong codebase. Đối với bất kỳ giá trị thuộc tính được áp dụng nào, có thể có nhiều khai báo bị gạch chân từ nhiều nguồn khác nhau. Nếu bạn thấy kiểu bị gạch chân có bộ chọn với độ đặc hiệu lớn hơn, điều đó có nghĩa là giá trị không có nguồn gốc hoặc tầm quan trọng.

Thường thì khi độ phức tạp của trang web tăng lên, số lượng stylesheet cũng tăng lên, điều này làm cho thứ tự nguồn của các stylesheet vừa quan trọng hơn vừa phức tạp hơn. Cascade layers đơn giản hóa việc duy trì stylesheet trên các codebase như vậy. Cascade layers là các vùng chứa độ đặc hiệu rõ ràng cung cấp kiểm soát đơn giản hơn và lớn hơn đối với các khai báo CSS cuối cùng được áp dụng, cho phép các nhà phát triển web ưu tiên các phần của CSS mà không phải đấu tranh với độ đặc hiệu.

Để hiểu cascade layers, bạn phải hiểu CSS cascade rõ ràng. Các phần bên dưới cung cấp tóm tắt nhanh về các khái niệm cascade quan trọng.

## Ôn lại khái niệm cascade

'C' trong CSS viết tắt là "Cascading" (Tầng). Đây là phương pháp mà các kiểu tầng cùng nhau. User agent chạy qua một số bước được xác định rõ ràng để xác định các giá trị được gán cho mọi thuộc tính cho mọi phần tử. Chúng ta sẽ liệt kê ngắn gọn các bước này ở đây và sau đó đào sâu hơn vào bước 4, **Cascade layers**, là điều bạn đến đây để học:

1. **Sự liên quan:** Tìm tất cả các khối khai báo với bộ chọn khớp cho mỗi phần tử.
2. **Tầm quan trọng:** Sắp xếp các quy tắc dựa trên việc chúng bình thường hay quan trọng. Các kiểu quan trọng là những kiểu có cờ {{cssxref("important", "!important")}} được đặt.
3. **Nguồn gốc:** Trong mỗi hai nhóm tầm quan trọng, sắp xếp các quy tắc theo nguồn gốc tác giả, người dùng, hoặc user-agent.
4. **Cascade layers:** Trong mỗi sáu nhóm nguồn gốc tầm quan trọng, sắp xếp theo cascade layer. Thứ tự lớp cho các khai báo bình thường là từ lớp được tạo đầu tiên đến lớp cuối cùng, tiếp theo là các kiểu bình thường không có lớp. Thứ tự này bị đảo ngược cho các kiểu quan trọng, với các kiểu quan trọng không có lớp có ưu tiên thấp nhất.
5. **Độ đặc hiệu:** Đối với các kiểu cạnh tranh trong lớp nguồn gốc có ưu tiên, sắp xếp khai báo theo [độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity).
6. **Gần gũi phạm vi**: Khi hai bộ chọn trong lớp nguồn gốc có ưu tiên có cùng độ đặc hiệu, giá trị thuộc tính trong các quy tắc có phạm vi với số bước nhỏ nhất lên cấp bậc DOM đến gốc phạm vi thắng. Xem [Cách giải quyết xung đột `@scope`](/en-US/docs/Web/CSS/Reference/At-rules/@scope#how_scope_conflicts_are_resolved) để biết thêm chi tiết và ví dụ.
7. **Thứ tự xuất hiện:** Khi hai bộ chọn trong lớp nguồn gốc có ưu tiên có cùng độ đặc hiệu và gần gũi phạm vi, giá trị thuộc tính từ bộ chọn được khai báo cuối cùng với độ đặc hiệu cao nhất thắng.

Đối với mỗi bước, chỉ các khai báo "còn trong cuộc chạy" chuyển sang "cạnh tranh" trong bước tiếp theo. Nếu chỉ có một khai báo trong cuộc chạy, nó "thắng", và các bước tiếp theo không có ý nghĩa.

### Nguồn gốc và cascade

Có ba [loại nguồn gốc cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#origin_types): stylesheet user-agent, stylesheet người dùng, và stylesheet tác giả. Trình duyệt sắp xếp mỗi khai báo vào sáu nhóm nguồn gốc theo nguồn gốc và tầm quan trọng. Có tám cấp độ ưu tiên: sáu nhóm nguồn gốc, các thuộc tính đang chuyển tiếp, và các thuộc tính đang hoạt hình. Thứ tự ưu tiên đi từ kiểu user-agent bình thường, có ưu tiên thấp nhất, đến các kiểu trong các hoạt hình hiện đang áp dụng, đến các kiểu user-agent quan trọng, và sau đó các kiểu đang chuyển tiếp, có ưu tiên cao nhất:

1. kiểu bình thường user-agent
2. kiểu bình thường người dùng
3. kiểu bình thường tác giả
4. kiểu đang hoạt hình
5. kiểu quan trọng tác giả
6. kiểu quan trọng người dùng
7. kiểu quan trọng user-agent
8. kiểu đang chuyển tiếp

"User-agent" là trình duyệt. "User" là khách truy cập trang. "Author" là bạn, nhà phát triển. Các kiểu được khai báo trực tiếp trên phần tử với phần tử {{HTMLElement('style')}} là kiểu tác giả. Không bao gồm kiểu hoạt hình và chuyển tiếp, kiểu bình thường user-agent có ưu tiên thấp nhất; kiểu quan trọng user-agent có ưu tiên cao nhất.

### Nguồn gốc và độ đặc hiệu

Đối với mỗi thuộc tính, khai báo "thắng" là khai báo từ nguồn gốc có ưu tiên dựa trên trọng lượng (bình thường hoặc quan trọng). Bỏ qua các lớp hiện tại, giá trị từ nguồn gốc có ưu tiên cao nhất được áp dụng. Nếu nguồn gốc thắng có nhiều hơn một khai báo thuộc tính cho một phần tử, [độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) của các bộ chọn cho các giá trị thuộc tính cạnh tranh đó được so sánh. Độ đặc hiệu không bao giờ được so sánh giữa các bộ chọn từ các nguồn gốc khác nhau.

Trong ví dụ bên dưới, có hai liên kết. Cái đầu tiên không có kiểu tác giả được áp dụng, vì vậy chỉ có kiểu user-agent được áp dụng (và kiểu người dùng cá nhân của bạn, nếu có). Cái thứ hai có {{cssxref("text-decoration")}} và {{cssxref("color")}} được đặt bởi kiểu tác giả ngay cả khi bộ chọn trong stylesheet tác giả có độ đặc hiệu là [`0-0-0`](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#selector_weight_categories). Lý do tại sao kiểu tác giả "thắng" là vì khi có các kiểu xung đột từ các nguồn gốc khác nhau, các quy tắc từ nguồn gốc có ưu tiên được áp dụng, bất kể độ đặc hiệu trong nguồn gốc không có ưu tiên.

```html live-sample___basic-cascade
<p><a href="https://example.org">User agent styles</a></p>
<p><a class="author" href="https://example.org">Author styles</a></p>
```

```css live-sample___basic-cascade
:where(a.author) {
  text-decoration: overline;
  color: red;
}
```

{{EmbedLiveSample("basic-cascade")}}

Bộ chọn "cạnh tranh" trong stylesheet user-agent tại thời điểm viết là `a:any-link`, có trọng lượng độ đặc hiệu là `0-1-1`. Mặc dù điều này lớn hơn bộ chọn `0-0-0` trong stylesheet tác giả, ngay cả khi bộ chọn trong user agent hiện tại của bạn khác nhau, nó không quan trọng: các trọng lượng độ đặc hiệu từ nguồn gốc tác giả và user-agent không bao giờ được so sánh. Tìm hiểu thêm về [cách tính trọng lượng độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#how_is_specificity_calculated).

Ưu tiên nguồn gốc luôn thắng hơn độ đặc hiệu bộ chọn. Nếu một thuộc tính phần tử được tạo kiểu với khai báo kiểu bình thường trong nhiều nguồn gốc, stylesheet tác giả sẽ luôn ghi đè các thuộc tính bình thường dư thừa được khai báo trong stylesheet người dùng hoặc user-agent. Nếu kiểu quan trọng, stylesheet user-agent sẽ luôn thắng hơn kiểu tác giả và người dùng. Ưu tiên nguồn gốc cascade đảm bảo các xung đột độ đặc hiệu giữa các nguồn gốc không bao giờ xảy ra.

Một điều cuối cùng cần lưu ý trước khi tiếp tục: thứ tự xuất hiện trở nên liên quan chỉ khi các khai báo cạnh tranh trong nguồn gốc ưu tiên có cùng độ đặc hiệu.

## Tổng quan về cascade layers

Chúng ta bây giờ hiểu "ưu tiên nguồn gốc cascade", nhưng "ưu tiên cascade layer" là gì? Chúng ta sẽ trả lời câu hỏi đó bằng cách xử lý cascade layers là gì, cách chúng được sắp xếp, và cách các kiểu được gán cho cascade layers. Chúng ta sẽ đề cập đến [các lớp thông thường](#creating_cascade_layers), [các lớp lồng nhau](#overview_of_nested_cascade_layers), và các lớp ẩn danh. Hãy thảo luận về cascade layers là gì và những vấn đề gì chúng giải quyết.

### Thứ tự ưu tiên cascade layer

Tương tự như cách chúng ta có sáu cấp độ ưu tiên dựa trên nguồn gốc và tầm quan trọng, cascade layers cho phép chúng ta tạo ra cấp độ ưu tiên sub-origin trong bất kỳ nguồn gốc nào trong số đó.

Trong mỗi sáu nhóm nguồn gốc, có thể có nhiều cascade layers. [Thứ tự tạo lớp](/en-US/docs/Web/CSS/Reference/At-rules/@layer) quan trọng rất nhiều. Đó là thứ tự tạo thiết lập thứ tự ưu tiên giữa các lớp trong một nguồn gốc.

Trong các nhóm nguồn gốc bình thường, các lớp được sắp xếp theo thứ tự tạo của từng lớp. Thứ tự ưu tiên là từ lớp được tạo đầu tiên đến lớp cuối cùng, tiếp theo là các kiểu bình thường không có lớp.

Thứ tự này bị đảo ngược cho các kiểu quan trọng. Tất cả các kiểu quan trọng không có lớp tầng cùng nhau vào một lớp ngầm có ưu tiên hơn tất cả các kiểu bình thường không chuyển tiếp. Các kiểu quan trọng không có lớp có ưu tiên thấp hơn bất kỳ kiểu quan trọng có lớp nào. Các kiểu quan trọng trong các lớp được khai báo trước có ưu tiên hơn các kiểu quan trọng trong các lớp được khai báo tiếp theo trong cùng nguồn gốc.

Đối với phần còn lại của hướng dẫn này, chúng ta sẽ giới hạn thảo luận về các kiểu tác giả, nhưng hãy nhớ rằng các lớp cũng có thể tồn tại trong stylesheet người dùng và user-agent.

### Những vấn đề cascade layers có thể giải quyết

Các codebase lớn có thể có các kiểu đến từ nhiều nhóm, thư viện thành phần, framework, và các bên thứ ba. Dù có bao nhiêu stylesheet được bao gồm, tất cả các kiểu này tầng cùng nhau trong một nguồn gốc duy nhất: stylesheet _tác giả_.

Có các kiểu từ nhiều nguồn tầng cùng nhau, đặc biệt là từ các nhóm không làm việc cùng nhau, có thể tạo ra vấn đề. Các nhóm khác nhau có thể có các phương pháp khác nhau; một nhóm có thể có thực hành tốt nhất là giảm độ đặc hiệu, trong khi nhóm khác có thể có tiêu chuẩn bao gồm `id` trong mỗi bộ chọn.

Các xung đột độ đặc hiệu có thể leo thang nhanh chóng. Một nhà phát triển web có thể tạo ra "bản sửa lỗi nhanh" bằng cách thêm cờ `!important`. Mặc dù điều này có thể cảm thấy như một giải pháp dễ dàng, nhưng nó thường chỉ chuyển cuộc chiến độ đặc hiệu từ các khai báo bình thường sang quan trọng.

Theo cách tương tự như nguồn gốc cascade cung cấp sự cân bằng quyền lực giữa người dùng, user-agent, và kiểu tác giả, cascade layers cung cấp một cách có cấu trúc để tổ chức và cân bằng các mối quan tâm trong một nguồn gốc duy nhất như thể mỗi lớp trong nguồn gốc là một sub-origin. Một lớp có thể được tạo cho mỗi nhóm, thành phần, và bên thứ ba, với ưu tiên kiểu dựa trên thứ tự lớp.

Các quy tắc trong một lớp tầng cùng nhau, mà không cạnh tranh với các quy tắc kiểu bên ngoài lớp. Cascade layers cho phép ưu tiên toàn bộ stylesheet hơn các stylesheet khác, mà không phải lo lắng về độ đặc hiệu giữa các sub-origin này.

Ưu tiên lớp luôn đánh bại độ đặc hiệu bộ chọn. Các kiểu trong các lớp có ưu tiên "thắng" hơn các lớp có ít ưu tiên hơn. Độ đặc hiệu của bộ chọn trong lớp thua cuộc là không liên quan. Độ đặc hiệu vẫn quan trọng đối với các giá trị thuộc tính cạnh tranh trong một lớp, nhưng không có mối lo ngại độ đặc hiệu giữa các lớp vì chỉ có lớp ưu tiên cao nhất cho mỗi thuộc tính được xem xét.

### Những vấn đề cascade layers lồng nhau có thể giải quyết

Cascade layers cho phép tạo các lớp lồng nhau. Mỗi cascade layer có thể chứa các lớp lồng nhau.

Ví dụ, một thư viện thành phần có thể được nhập vào một lớp `components`. Một cascade layer thông thường sẽ thêm thư viện thành phần vào nguồn gốc tác giả, loại bỏ bất kỳ xung đột độ đặc hiệu nào với các kiểu tác giả khác. Trong lớp `components`, một nhà phát triển có thể chọn định nghĩa các theme khác nhau, mỗi theme là một lớp lồng nhau riêng biệt. Thứ tự của các lớp theme lồng nhau này có thể được xác định dựa trên media queries (xem phần [Tạo lớp và media queries](#layer_creation_and_media_queries) bên dưới), chẳng hạn như kích thước viewport hoặc [hướng](/en-US/docs/Web/CSS/Reference/At-rules/@media/orientation). Các lớp lồng nhau này cung cấp cách tạo các theme không xung đột dựa trên độ đặc hiệu.

Khả năng lồng các lớp rất hữu ích cho bất kỳ ai làm việc phát triển thư viện thành phần, framework, widget bên thứ ba, và theme.

Khả năng tạo các lớp lồng nhau cũng loại bỏ lo lắng về việc có tên lớp xung đột. Chúng ta sẽ đề cập đến điều này trong phần [lớp lồng nhau](#overview_of_nested_cascade_layers).

> "Các tác giả có thể tạo các lớp để đại diện cho mặc định phần tử, thư viện bên thứ ba, theme, thành phần, ghi đè, và các mối quan tâm tạo kiểu khác — và có thể sắp xếp lại cascade của các lớp theo cách rõ ràng, mà không cần thay đổi bộ chọn hoặc độ đặc hiệu trong mỗi lớp, hoặc dựa vào thứ tự xuất hiện để giải quyết xung đột giữa các lớp."
>
> —[Cascading and Inheritance specification](https://drafts.csswg.org/css-cascade-5/#layering).

## Tạo cascade layers

Các lớp có thể được tạo bằng bất kỳ phương pháp nào sau đây:

- At-rule câu lệnh {{cssxref("@layer")}}, khai báo các lớp sử dụng `@layer` theo sau là tên của một hoặc nhiều lớp. Điều này tạo ra các lớp được đặt tên mà không gán bất kỳ kiểu nào cho chúng.
- At-rule khối `@layer`, trong đó tất cả các kiểu trong một khối được thêm vào một lớp được đặt tên hoặc không được đặt tên.
- Quy tắc {{cssxref("@import")}} với từ khóa `layer` hoặc hàm `layer()`, gán nội dung của tệp được nhập vào lớp đó.

Cả ba phương pháp đều tạo một lớp nếu một lớp với tên đó chưa được khởi tạo. Nếu không có tên lớp nào được cung cấp trong at-rule `@layer` hoặc `@import` với `layer()`, một lớp ẩn danh (không được đặt tên) mới được tạo.

> [!NOTE]
> Thứ tự ưu tiên của các lớp là thứ tự chúng được tạo. Các kiểu không trong lớp, hoặc "các kiểu không có lớp", tầng cùng nhau vào một lớp ngầm cuối cùng.

Hãy đề cập đến ba cách tạo lớp một cách chi tiết hơn trước khi thảo luận về các lớp lồng nhau.

### At-rule câu lệnh @layer cho các lớp được đặt tên

Thứ tự của các lớp được thiết lập bởi thứ tự chúng xuất hiện trong CSS của bạn. Khai báo các lớp sử dụng `@layer` theo sau là tên của một hoặc nhiều lớp mà không gán bất kỳ kiểu nào là một cách để xác định [thứ tự lớp](#determining_the_precedence_based_on_the_order_of_layers).

At-rule CSS {{cssxref("@layer")}} được sử dụng để khai báo cascade layer và xác định thứ tự ưu tiên khi có nhiều cascade layers. At-rule sau khai báo ba lớp, theo thứ tự được liệt kê:

```css
@layer theme, layout, utilities;
```

Bạn thường muốn dòng đầu tiên CSS của mình là khai báo `@layer` này (với tên lớp có ý nghĩa cho trang web của bạn, tất nhiên) để có quyền kiểm soát hoàn toàn đối với thứ tự lớp.

Nếu câu lệnh trên là dòng đầu tiên của CSS của trang web, thứ tự lớp sẽ là `theme`, `layout`, và `utilities`. Nếu một số lớp đã được tạo trước câu lệnh trên, miễn là các lớp với tên này chưa tồn tại, ba lớp này sẽ được tạo và thêm vào cuối danh sách các lớp hiện có. Tuy nhiên, nếu một lớp với cùng tên đã tồn tại, câu lệnh trên sẽ chỉ tạo hai lớp mới. Ví dụ, nếu `layout` đã tồn tại, chỉ `theme` và `utilities` sẽ được tạo, nhưng thứ tự của các lớp, trong trường hợp này, sẽ là `layout`, `theme`, và `utilities`.

### At-rule khối @layer cho các lớp được đặt tên và ẩn danh

Các lớp có thể được tạo bằng at-rule khối `@layer`. Nếu at-rule `@layer` được theo sau bởi một định danh và một khối kiểu, định danh được sử dụng để đặt tên cho lớp, và các kiểu trong at-rule này được thêm vào kiểu của lớp. Nếu lớp với tên được chỉ định chưa tồn tại, một lớp mới sẽ được tạo. Nếu lớp với tên được chỉ định đã tồn tại, các kiểu được thêm vào lớp đã tồn tại trước đó. Nếu không có tên nào được chỉ định trong khi tạo một khối kiểu bằng `@layer`, các kiểu trong at-rule sẽ được thêm vào một lớp ẩn danh mới.

Trong ví dụ bên dưới, chúng ta đã sử dụng bốn at-rule khối `@layer` và một at-rule câu lệnh `@layer`. CSS này thực hiện những điều sau theo thứ tự được liệt kê:

1. Tạo lớp được đặt tên `layout`
2. Tạo lớp ẩn danh, không được đặt tên
3. Khai báo danh sách ba lớp và chỉ tạo hai lớp mới, `theme` và `utilities`, vì `layout` đã tồn tại
4. Thêm kiểu bổ sung vào lớp `layout` đã tồn tại
5. Tạo lớp ẩn danh, không được đặt tên thứ hai

```css
/* file: layers1.css */

/* unlayered styles */
body {
  color: #333333;
}

/* creates the first layer: `layout` */
@layer layout {
  main {
    display: grid;
  }
}

/* creates the second layer: an unnamed, anonymous layer */
@layer {
  body {
    margin: 0;
  }
}

/* creates the third and fourth layers: `theme` and `utilities` */
@layer theme, layout, utilities;

/* adds styles to the already existing `layout` layer */
@layer layout {
  main {
    color: black;
  }
}

/* creates the fifth layer: an unnamed, anonymous layer */
@layer {
  body {
    margin: 1vw;
  }
}
```

Trong CSS trên, chúng ta đã tạo năm lớp: `layout`, `<anonymous(01)>`, `theme`, `utilities`, và `<anonymous(02)>` – theo thứ tự đó - với một lớp ngầm thứ sáu của các kiểu không có lớp được chứa trong khối kiểu `body`. Thứ tự lớp là thứ tự mà các lớp được tạo, với lớp ngầm của các kiểu không có lớp luôn là lớp cuối cùng. Không có cách nào để thay đổi thứ tự lớp sau khi đã tạo.

Chúng ta đã gán một số kiểu cho lớp có tên `layout`. Nếu lớp có tên chưa tồn tại, thì việc chỉ định tên trong at-rule `@layer`, dù có hay không có gán kiểu cho lớp, tạo ra lớp; điều này thêm lớp vào cuối chuỗi tên lớp hiện có. Nếu lớp có tên đã tồn tại, tất cả các kiểu trong khối có tên được thêm vào các kiểu trong lớp đã tồn tại trước đó – chỉ định kiểu trong khối bằng cách sử dụng lại tên lớp đã tồn tại không tạo lớp mới.

Các lớp ẩn danh được tạo bằng cách gán kiểu cho lớp mà không đặt tên cho lớp. Kiểu chỉ có thể được thêm vào lớp không được đặt tên tại thời điểm tạo ra nó.

> [!NOTE]
> Việc sử dụng tiếp theo `@layer` mà không có tên lớp sẽ tạo thêm các lớp không được đặt tên; nó không thêm kiểu vào lớp không được đặt tên đã tồn tại trước đó.

At-rule `@layer` tạo lớp, dù có tên hay không, hoặc thêm kiểu vào lớp nếu lớp có tên đã tồn tại. Chúng ta đã gọi lớp ẩn danh đầu tiên là `<anonymous(01)>` và thứ hai là `<anonymous(02)>`, điều này chỉ để chúng ta có thể giải thích chúng. Đây thực sự là các lớp không được đặt tên. Không có cách nào để tham chiếu chúng hoặc thêm kiểu bổ sung vào chúng.

Tất cả các kiểu được khai báo bên ngoài lớp được kết hợp trong một lớp ngầm. Trong mã ví dụ trên, khai báo đầu tiên đặt thuộc tính `color: #333333` trên `body`. Điều này được khai báo bên ngoài bất kỳ lớp nào. Các khai báo bình thường không có lớp được ưu tiên hơn các khai báo có lớp bình thường ngay cả khi các kiểu không có lớp có độ đặc hiệu thấp hơn và xuất hiện trước trong thứ tự xuất hiện. Điều này giải thích tại sao mặc dù CSS không có lớp được khai báo đầu tiên trong khối mã, lớp ngầm chứa các kiểu không có lớp này được ưu tiên như thể đó là lớp được khai báo cuối cùng.

Trong dòng `@layer theme, layout, utilities;`, trong đó một loạt các lớp được khai báo, chỉ có các lớp `theme` và `utilities` được tạo; `layout` đã được tạo trong dòng đầu tiên. Lưu ý rằng khai báo này không thay đổi thứ tự của các lớp đã được tạo. Hiện tại không có cách nào để sắp xếp lại các lớp sau khi đã khai báo.

Trong ví dụ sau, chúng ta gán kiểu cho hai lớp, tạo chúng và đặt tên cho chúng trong quá trình. Vì chúng đã tồn tại, được tạo khi được sử dụng lần đầu tiên, khai báo chúng trên dòng cuối cùng không làm gì.

```html live-sample___layer-order
<h1>Is this heading underlined?</h1>
```

```css live-sample___layer-order
@layer page {
  h1 {
    text-decoration: overline;
    color: red;
  }
}

@layer site {
  h1 {
    text-decoration: underline;
    color: green;
  }
}

/* this does nothing */
@layer site, page;
```

{{EmbedLiveSample("layer-order")}}

Hãy thử di chuyển dòng cuối cùng, `@layer site, page;`, để làm cho nó trở thành dòng đầu tiên. Điều gì xảy ra?

#### Tạo lớp và media queries

Nếu bạn xác định lớp bằng cách sử dụng [media](/en-US/docs/Web/CSS/Guides/Media_queries/Using) hoặc [feature](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries) queries, và media không khớp hoặc tính năng không được hỗ trợ, lớp không được tạo. Ví dụ bên dưới cho thấy cách thay đổi kích thước thiết bị hoặc trình duyệt của bạn có thể thay đổi thứ tự lớp. Trong ví dụ này, chúng ta chỉ tạo lớp `site` trong các trình duyệt rộng hơn. Sau đó chúng ta gán kiểu cho các lớp `page` và `site`, theo thứ tự đó.

```html live-sample___media-order
<h1>Is this heading underlined?</h1>
```

```css live-sample___media-order
@media (width >= 50em) {
  @layer site;
}

@layer page {
  h1 {
    text-decoration: overline;
    color: red;
  }
}

@layer site {
  h1 {
    text-decoration: underline;
    color: green;
  }
}
```

{{EmbedLiveSample("media-order")}}

Trên màn hình rộng, lớp `site` được khai báo trong dòng đầu tiên, có nghĩa là `site` có ưu tiên ít hơn so với `page`. Ngược lại, `site` có ưu tiên hơn `page` vì nó được khai báo sau trên màn hình hẹp. Nếu điều đó không hoạt động, hãy thử thay đổi `50em` trong media query thành `10em` hoặc `100em`.

### Nhập stylesheet vào các lớp được đặt tên và ẩn danh với @import

Quy tắc {{cssxref("@import")}} cho phép người dùng nhập các quy tắc kiểu từ các stylesheet khác trực tiếp vào tệp CSS hoặc vào phần tử {{htmlelement('style')}}.

Khi nhập stylesheet, câu lệnh `@import` phải được xác định trước bất kỳ kiểu CSS nào trong stylesheet hoặc khối `<style>`. Câu lệnh `@import` phải xuất hiện trước, trước bất kỳ kiểu nào, nhưng có thể được đứng trước bởi at-rule `@layer` tạo một hoặc nhiều lớp mà không gán bất kỳ kiểu nào cho các lớp. (`@import` cũng có thể được đứng trước bởi quy tắc {{cssxref("@charset")}}.)

Bạn có thể nhập stylesheet vào lớp được đặt tên, lớp lồng được đặt tên, hoặc lớp ẩn danh. Lớp sau nhập stylesheet vào lớp `components`, lớp lồng `dialog` trong lớp `components`, và một lớp không được đặt tên, tương ứng:

```css
@import "components-lib.css" layer(components);
@import "dialog.css" layer(components.dialog);
@import "marketing.css" layer();
```

Bạn có thể nhập nhiều hơn một tệp CSS vào một lớp duy nhất. Khai báo sau nhập hai tệp riêng biệt vào một lớp `social` duy nhất:

```css
@import "comments.css" layer(social);
@import "sm-icons.css" layer(social);
```

Bạn có thể nhập kiểu và tạo các lớp dựa trên các điều kiện cụ thể bằng cách sử dụng [media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using) và [feature queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries). Phần sau nhập stylesheet vào lớp `international` chỉ khi trình duyệt hỗ trợ `display: ruby`, và tệp được nhập phụ thuộc vào chiều rộng màn hình.

```css
@import "ruby-narrow.css" layer(international) supports(display: ruby)
  (width < 32rem);
@import "ruby-wide.css" layer(international) supports(display: ruby)
  (width >= 32rem);
```

> [!NOTE]
> Không có phương thức tương đương của phương thức {{HTMLElement('link')}} để liên kết stylesheet. Sử dụng `@import` để nhập stylesheet vào lớp khi bạn không thể sử dụng `@layer` trong stylesheet.

## Tổng quan về cascade layers lồng nhau

Các lớp lồng nhau là các lớp trong một lớp được đặt tên hoặc ẩn danh. Mỗi cascade layer, ngay cả lớp ẩn danh, có thể chứa các lớp lồng nhau. Các lớp được nhập vào lớp khác trở thành các lớp lồng nhau trong lớp đó.

### Ưu điểm của việc lồng các lớp

Khả năng lồng các lớp cho phép các nhóm tạo cascade layers mà không lo lắng liệu các nhóm khác có nhập chúng vào một lớp hay không. Tương tự, việc lồng ghép cho phép bạn nhập stylesheet bên thứ ba vào một lớp mà không lo lắng nếu stylesheet đó có các lớp của riêng nó. Vì các lớp có thể được lồng nhau, bạn không phải lo lắng về việc có tên lớp xung đột giữa stylesheet bên ngoài và nội bộ.

### Tạo cascade layers lồng nhau

Các lớp lồng nhau có thể được tạo bằng cách sử dụng cùng các phương pháp như được mô tả cho các lớp thông thường. Ví dụ, chúng có thể được tạo bằng at-rule `@layer` theo sau là tên của một hoặc nhiều lớp, sử dụng ký hiệu dấu chấm. Nhiều dấu chấm và tên lớp biểu thị việc lồng nhau nhiều.

Nếu bạn lồng at-rule khối `@layer` vào bên trong at-rule khối `@layer` khác, có hoặc không có tên, khối lồng nhau trở thành lớp lồng nhau. Tương tự, khi stylesheet được nhập với khai báo `@import` chứa từ khóa `layer` hoặc hàm `layer()`, các kiểu được gán cho lớp được đặt tên hoặc ẩn danh đó. Nếu câu lệnh `@import` chứa các lớp, những lớp đó trở thành lớp lồng nhau trong lớp ẩn danh hoặc được đặt tên đó.

Hãy xem ví dụ sau:

```css
@import "components-lib.css" layer(components);
@import "narrow-theme.css" layer(components.narrow);
```

Trong dòng đầu tiên, chúng ta nhập `components-lib.css` vào lớp `components`. Nếu tệp đó chứa bất kỳ lớp nào, dù có tên hay không, những lớp đó trở thành lớp lồng nhau trong lớp `components`.

Dòng thứ hai nhập `narrow-theme.css` vào lớp `narrow`, là lớp con của `components`. Lớp lồng `components.narrow` được tạo là lớp cuối cùng trong lớp `components`, trừ khi `components-lib.css` đã chứa lớp `narrow`, trong trường hợp đó, nội dung của `narrow-theme.css` sẽ được thêm vào lớp lồng nhau `components.narrow`. Các lớp lồng được đặt tên bổ sung có thể được thêm vào lớp `components` bằng cách sử dụng mẫu `components.<layerName>`. Như đã đề cập trước đó, các lớp không được đặt tên có thể được tạo nhưng chúng không thể được truy cập sau đó.

Hãy xem một ví dụ khác, nơi chúng ta [nhập `layers1.css` vào lớp được đặt tên](#the_layer_block_at-rule_for_named_and_anonymous_layers) bằng câu lệnh sau:

```css
@import "layers1.css" layer(example);
```

Điều này sẽ tạo một lớp duy nhất có tên `example` chứa một số khai báo và năm lớp lồng nhau - `example.layout`, `example.<anonymous(01)>`, `example.theme`, `example.utilities`, và `example.<anonymous(02)>`.

Để thêm kiểu vào lớp lồng được đặt tên, hãy sử dụng ký hiệu dấu chấm:

```css
@layer example.layout {
  main {
    width: 50vw;
  }
}
```

## Xác định ưu tiên dựa trên thứ tự của các lớp

Thứ tự của các lớp xác định thứ tự ưu tiên của chúng. Do đó, thứ tự của các lớp rất quan trọng. Theo cách tương tự như cascade sắp xếp theo nguồn gốc và tầm quan trọng, cascade sắp xếp mỗi khai báo CSS theo lớp nguồn gốc và tầm quan trọng.

### Thứ tự ưu tiên của cascade layers thông thường

```css
@import "A.css" layer(firstLayer);
@import "B.css" layer(secondLayer);
@import "C.css";
```

Mã trên tạo hai lớp được đặt tên (các kiểu C.css được thêm vào lớp ngầm của các kiểu không có lớp). Hãy giả sử rằng ba tệp (`A.css`, `B.css`, và `C.css`) không chứa bất kỳ lớp bổ sung nào bên trong chúng. Danh sách sau đây cho thấy nơi các kiểu được khai báo bên trong và bên ngoài các tệp này sẽ được sắp xếp từ ưu tiên thấp nhất (1) đến cao nhất (10).

1. Kiểu bình thường `firstLayer` (`A.css`)
2. Kiểu bình thường `secondLayer` (`B.css`)
3. Kiểu bình thường không có lớp (`C.css`)
4. Kiểu nội tuyến bình thường
5. Kiểu hoạt hình
6. Kiểu quan trọng không có lớp (`C.css`)
7. Kiểu quan trọng `secondLayer` (`B.css`)
8. Kiểu quan trọng `firstLayer` (`A.css`)
9. Kiểu nội tuyến quan trọng
10. Kiểu chuyển tiếp

Các kiểu bình thường được khai báo trong các lớp nhận được ưu tiên thấp nhất và được sắp xếp theo thứ tự các lớp được tạo. Các kiểu bình thường trong lớp được tạo đầu tiên có ưu tiên thấp nhất, và các kiểu bình thường trong lớp được tạo cuối cùng có ưu tiên cao nhất trong số các lớp. Nói cách khác, các kiểu bình thường được khai báo trong `firstLayer` sẽ bị ghi đè bởi bất kỳ kiểu nào tiếp theo trong danh sách nếu có xung đột.

Tiếp theo là bất kỳ kiểu nào được khai báo bên ngoài các lớp. Các kiểu trong `C.css` không được nhập vào lớp và sẽ ghi đè bất kỳ kiểu xung đột nào từ `firstLayer` và `secondLayer`. Các kiểu không được khai báo trong lớp luôn có ưu tiên cao hơn các kiểu _được_ khai báo trong lớp (ngoại trừ các kiểu quan trọng).

Kiểu nội tuyến được khai báo bằng cách sử dụng [thuộc tính `style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style). Kiểu bình thường được khai báo theo cách này sẽ được ưu tiên hơn kiểu bình thường được tìm thấy trong stylesheet không có lớp và có lớp (`firstLayer – A.css`, `secondLayer – B.css`, và `C.css`).

Kiểu hoạt hình có ưu tiên cao hơn tất cả kiểu bình thường, bao gồm cả kiểu nội tuyến bình thường.

Kiểu quan trọng, tức là các giá trị thuộc tính bao gồm cờ `!important`, được ưu tiên hơn bất kỳ kiểu nào được đề cập trước đó trong danh sách của chúng ta. Chúng được sắp xếp theo thứ tự ngược của kiểu bình thường. Bất kỳ kiểu quan trọng nào được khai báo bên ngoài lớp có ưu tiên ít hơn những kiểu được khai báo trong lớp. Kiểu quan trọng được tìm thấy trong các lớp cũng được sắp xếp theo thứ tự tạo lớp. Đối với kiểu quan trọng, lớp được tạo cuối cùng có ưu tiên thấp nhất, và lớp được tạo đầu tiên có ưu tiên cao nhất trong số các lớp được khai báo.

Kiểu nội tuyến quan trọng lại có ưu tiên cao hơn kiểu quan trọng được khai báo ở nơi khác.

Kiểu chuyển tiếp có ưu tiên cao nhất. Khi giá trị thuộc tính bình thường đang chuyển tiếp, nó được ưu tiên hơn tất cả các khai báo giá trị thuộc tính khác, ngay cả kiểu nội tuyến quan trọng; nhưng chỉ khi đang chuyển tiếp.

```html live-sample___layer-precedence
<div>
  <h1 style="color: yellow; background-color: maroon !important;">
    Inline styles
  </h1>
</div>
```

```css live-sample___layer-precedence
@layer A, B;

h1 {
  font-family: sans-serif;
  margin: 1em;
  padding: 0.2em;
  color: orange;
  background-color: green;
  text-decoration: overline pink !important;
  box-shadow: 5px 5px lightgreen !important;
}

@layer A {
  h1 {
    color: grey;
    background-color: black !important;
    text-decoration: line-through grey;
    box-shadow: -5px -5px lightblue !important;
    font-style: normal;
    font-weight: normal !important;
  }
}

@layer B {
  h1 {
    color: aqua;
    background: yellow !important;
    text-decoration: underline aqua;
    box-shadow: -5px 5px magenta !important;
    font-style: italic;
    font-weight: bold !important;
  }
}
```

{{EmbedLiveSample("layer-precedence")}}

Trong ví dụ này, hai lớp (`A` và `B`) ban đầu được định nghĩa bằng at-rule câu lệnh `@layer` mà không có bất kỳ kiểu nào. Kiểu lớp được định nghĩa trong hai at-rule khối `@layer` xuất hiện sau quy tắc CSS `h1` được khai báo bên ngoài bất kỳ lớp nào.

Kiểu nội tuyến được thêm trên phần tử `h1` bằng cách sử dụng thuộc tính `style`, đặt `color` bình thường và `background-color` quan trọng. Kiểu nội tuyến bình thường ghi đè tất cả kiểu bình thường có lớp và không có lớp. Kiểu nội tuyến quan trọng ghi đè tất cả kiểu bình thường và quan trọng tác giả có lớp và không có lớp. Không có cách nào để kiểu tác giả ghi đè kiểu nội tuyến quan trọng.

`text-decoration` bình thường và `box-shadow` quan trọng không phải là một phần của kiểu nội tuyến `style` và do đó có thể bị ghi đè. Đối với kiểu bình thường không phải nội tuyến, các kiểu không có lớp được ưu tiên. Đối với kiểu quan trọng, thứ tự lớp cũng quan trọng. Trong khi kiểu bình thường không có lớp ghi đè tất cả kiểu bình thường được đặt trong lớp, với kiểu quan trọng, thứ tự ưu tiên bị đảo ngược; kiểu quan trọng không có lớp có ưu tiên thấp hơn kiểu có lớp.

Hai kiểu được khai báo chỉ trong các lớp là `font-style`, với tầm quan trọng bình thường, và `font-weight` với cờ `!important`. Đối với kiểu bình thường, lớp `B`, được khai báo cuối cùng, ghi đè kiểu trong lớp được khai báo trước đó `A`. Đối với kiểu bình thường, các lớp sau có ưu tiên hơn các lớp trước. Thứ tự ưu tiên bị đảo ngược đối với kiểu quan trọng. Đối với các khai báo `font-weight` quan trọng, lớp `A`, được khai báo trước, được ưu tiên hơn lớp được khai báo cuối cùng `B`.

Bạn có thể đảo ngược thứ tự lớp bằng cách thay đổi dòng đầu tiên từ `@layer A, B;` thành `@layer B, A;`. Hãy thử điều đó. Những kiểu nào thay đổi vì điều này, và những kiểu nào giữ nguyên? Tại sao?

Thứ tự của các lớp được thiết lập bởi thứ tự chúng xuất hiện trong CSS của bạn. Trong dòng đầu tiên của chúng ta, chúng ta đã khai báo các lớp mà không gán bất kỳ kiểu nào bằng cách sử dụng `@layer` theo sau là tên các lớp, kết thúc bằng dấu chấm phẩy. Nếu chúng ta đã bỏ qua dòng này, kết quả sẽ giống nhau. Tại sao? Chúng ta đã gán các quy tắc kiểu trong các khối `@layer` được đặt tên theo thứ tự A sau đó B. Hai lớp được tạo trong dòng đầu tiên đó. Nếu chúng không được tạo, các khối quy tắc này sẽ tạo ra chúng, theo thứ tự đó.

Chúng ta đã bao gồm dòng đầu tiên đó vì hai lý do: đầu tiên để bạn có thể dễ dàng chỉnh sửa dòng và chuyển đổi thứ tự, và thứ hai vì thường bạn sẽ thấy việc khai báo thứ tự lớp trước là thực hành tốt nhất cho việc quản lý thứ tự lớp của bạn.

Tóm lại:

- Thứ tự ưu tiên của các lớp là thứ tự chúng được tạo.
- Sau khi được tạo, không có cách nào để thay đổi thứ tự lớp.
- Ưu tiên lớp cho kiểu bình thường là thứ tự các lớp được tạo.
- Kiểu bình thường không có lớp được ưu tiên hơn kiểu bình thường có lớp.
- Ưu tiên lớp cho kiểu quan trọng bị đảo ngược, với các lớp được tạo trước có ưu tiên hơn.
- Tất cả kiểu quan trọng có lớp được ưu tiên hơn kiểu quan trọng không có lớp (và kiểu bình thường).
- Kiểu nội tuyến bình thường được ưu tiên hơn tất cả kiểu bình thường, dù có lớp hay không.
- Kiểu nội tuyến quan trọng được ưu tiên hơn tất cả kiểu khác, ngoại trừ các kiểu đang chuyển tiếp.
- Không có cách nào để kiểu tác giả ghi đè kiểu nội tuyến quan trọng (ngoài việc chuyển tiếp chúng, là tạm thời).

### Thứ tự ưu tiên của cascade layers lồng nhau

Thứ tự ưu tiên cascade cho các lớp lồng nhau tương tự như của các lớp thông thường, nhưng được chứa trong lớp. Thứ tự ưu tiên dựa trên thứ tự tạo lớp lồng nhau. Các kiểu không lồng nhau trong lớp được ưu tiên hơn kiểu lồng nhau bình thường, với thứ tự ưu tiên bị đảo ngược đối với kiểu quan trọng. Trọng lượng độ đặc hiệu giữa các lớp lồng nhau không quan trọng, mặc dù nó quan trọng đối với các kiểu xung đột trong lớp lồng nhau.

Phần sau đây tạo và thêm kiểu cho lớp `components`, lớp lồng nhau `components.narrow`, và lớp lồng nhau `components.wide`:

```html hidden
<div>Text</div>
```

```css hidden
div {
  height: 150px;
  width: 150px;
  margin: 1rem;
  padding: 1rem;
  font-size: 3rem;
}
```

```css
div {
  background-color: wheat;
  color: pink !important;
}

@layer components {
  div {
    background-color: yellow;
    border: 1rem dashed red;
    color: orange !important;
  }
}

@layer components.narrow {
  div {
    background-color: skyblue;
    border: 1rem dashed blue;
    color: purple !important;
    border-radius: 50%;
  }
}

@layer components.wide {
  div {
    background-color: limegreen;
    border: 1rem dashed green;
    color: seagreen !important;
    border-radius: 20%;
  }
}
```

{{EmbedLiveSample("Precedence order of nested cascade layers", "100%", "250")}}

Đây là tóm tắt về các thuộc tính được sử dụng và lý do tại sao mỗi khai báo được áp dụng:

- `background-color`: Vì kiểu bình thường không có lớp được ưu tiên hơn kiểu bình thường có lớp, màu `wheat` thắng.
- `border`: Vì trong lớp, kiểu không lồng nhau được ưu tiên hơn kiểu lồng nhau bình thường, màu `red` thắng.
- `color`: Với kiểu quan trọng, kiểu có lớp được ưu tiên hơn kiểu không có lớp, với kiểu quan trọng trong các lớp được khai báo trước có ưu tiên hơn các lớp được khai báo sau. Trong ví dụ này, thứ tự tạo lớp lồng nhau là `components.narrow`, sau đó `components.wide`, vì vậy kiểu quan trọng trong `components.narrow` có ưu tiên hơn kiểu quan trọng trong `components.wide`, có nghĩa là màu `purple` thắng.
- `border-radius`: Thuộc tính chỉ được đặt trong các lớp lồng nhau nên theo thứ tự khai báo, bán kính `20%` thắng.

## Tóm tắt

Nếu bạn hiểu hầu hết bài viết này, thì xin chúc mừng — bây giờ bạn đã quen với các cơ chế cơ bản của các tầng tầng CSS.
