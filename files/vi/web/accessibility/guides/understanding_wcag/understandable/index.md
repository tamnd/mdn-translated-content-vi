---
title: Dễ hiểu
slug: Web/Accessibility/Guides/Understanding_WCAG/Understandable
page-type: guide
sidebar: accessibilitysidebar
---

Bài viết này cung cấp lời khuyên thực tế về cách viết nội dung web của bạn để nội dung đó tuân thủ các tiêu chí thành công được nêu trong nguyên tắc **Dễ hiểu** của Web Content Accessibility Guidelines (WCAG) 2.0 và 2.1. Dễ hiểu nói rằng thông tin và hoạt động của giao diện người dùng phải dễ hiểu.

> [!NOTE]
> Để đọc định nghĩa của W3C về Dễ hiểu và các hướng dẫn, tiêu chí thành công của nó, xem [Nguyên tắc 3: Dễ hiểu — Thông tin và hoạt động của giao diện người dùng phải dễ hiểu](https://w3c.github.io/wcag/guidelines/22/#understandable).

## Hướng dẫn 3.1 — Có thể đọc: Làm cho nội dung văn bản có thể đọc và dễ hiểu

Hướng dẫn này tập trung vào việc làm cho nội dung văn bản dễ hiểu nhất có thể.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Tiêu chí thành công</th>
      <th scope="col">Cách đáp ứng tiêu chí</th>
      <th scope="col">Tài nguyên thực hành</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3.1.1 Ngôn ngữ của trang (A)</td>
      <td>
        Ngôn ngữ con người mặc định của mỗi trang web nên có thể được phát hiện bằng mã. Điều này là thiết yếu để đảm bảo người đọc đã đến đúng trang được viết bằng ngôn ngữ phù hợp với họ. Cách đơn giản nhất để đạt được điều này là đặt thuộc tính <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/lang">lang</a>
        trên phần tử {{htmlelement("html")}} của trang, với
        giá trị bằng mã ngôn ngữ đại diện tốt nhất cho ngôn ngữ mà
        trang được viết.
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#setting_the_primary_language_of_the_document"
          >Đặt ngôn ngữ chính của tài liệu</a
        >.
      </td>
    </tr>
    <tr>
      <td>3.1.2 Ngôn ngữ của các phần (AA)</td>
      <td>
        <p>
          Trong trường hợp nội dung của một trang bao gồm các từ hoặc cụm từ
          thuộc ngôn ngữ khác với ngôn ngữ chính, hãy dùng thuộc tính
          <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/lang">lang</a> trên một phần tử bao bọc
          thuật ngữ đó (ví dụ: một {{htmlelement("span")}}
          nếu không có phần tử ngữ nghĩa phù hợp) để đặt ngôn ngữ thích hợp cho nó.
        </p>
        <p>
          Bạn không cần đặt ngôn ngữ khác cho các từ hoặc cụm từ giống nhau bất kể ngôn ngữ nào (ví dụ: tên riêng, thuật ngữ kỹ thuật không thuộc về một ngôn ngữ cụ thể).
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>3.1.3 Từ ngữ bất thường (AAA)</td>
      <td>
        Khi dùng thuật ngữ kỹ thuật, biệt ngữ, hoặc thành ngữ/tiếng lóng, nên cung cấp định nghĩa cho các cụm từ/từ như vậy. Website của bạn nên cung cấp một bảng thuật ngữ chứa định nghĩa của các từ/thuật ngữ đó để bạn có thể liên kết tới khi chúng xuất hiện, hoặc ít nhất cung cấp định nghĩa ở đâu đó trong đoạn văn xung quanh, hoặc trong một
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Lists#description_lists"
          >danh sách mô tả</a
        >
        ở cuối trang.
      </td>
      <td></td>
    </tr>
    <tr>
      <td>3.1.4 Chữ viết tắt (AAA)</td>
      <td>
        <p>
          Khi dùng chữ viết tắt, bạn nên cung cấp dạng đầy đủ của nó, hoặc định nghĩa nếu cần.
        </p>
        <p>
          Phần tử {{htmlelement("abbr")}} thường được xem là
          cách ưu tiên để cung cấp dạng mở rộng cho một chữ viết tắt — nó nhận một
          thuộc tính <a href="/en-US/docs/Web/HTML/Reference/Global_attributes/title">title</a> chứa dạng mở rộng, và nội dung này xuất hiện khi chữ viết tắt được rê chuột qua. Tuy nhiên, nội dung title không thể truy cập bằng bàn phím, và cũng không được trình đọc màn hình đọc ra một cách đáng tin cậy. Cách tốt hơn là lại cung cấp liên kết tới các trang bảng thuật ngữ chứa phần giải thích và dạng mở rộng của chữ viết tắt, hoặc ít nhất đưa chúng vào văn bản xung quanh trong ngữ cảnh.
        </p>
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Advanced_text_features#abbreviations"
          >Chữ viết tắt</a
        >.
      </td>
    </tr>
    <tr>
      <td>3.1.5 Trình độ đọc (AAA)</td>
      <td>
        <p>
          Nếu nội dung văn bản yêu cầu trình độ đọc cao hơn mức trung học cơ sở (thường là trẻ em khoảng 11-14 tuổi), hãy cung cấp tài liệu giải thích bổ sung để hỗ trợ những người không đọc được nó, hoặc cung cấp một phiên bản thay thế được viết ở mức trung học cơ sở.
        </p>
        <p>
          Điều này không có nghĩa là mọi chủ đề phải được mọi người hiểu, mà là phong cách viết nên có thể tiếp cận được với mọi người. Tốt hơn là chỉ viết tất cả nội dung ở mức trung học cơ sở, kể cả tài liệu kỹ thuật như hướng dẫn lập trình, trừ khi có lý do tốt để không làm vậy (ví dụ: một phong cách khác để tạo hiệu ứng thơ ca), hoặc chúng phải được viết theo một phong cách nghiêm ngặt (ví dụ: đặc tả W3C).
        </p>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>3.1.6 Phát âm (AAA)</td>
      <td>
        <p>
          Nên cung cấp một cơ chế để người dùng có thể tiếp cận cách phát âm của các từ khi điều đó cần thiết để hiểu đầy đủ nội dung.
        </p>
        <p>
          Phần tử HTML {{htmlelement("audio")}} có thể được dùng để
          tạo một điều khiển cho phép người đọc phát lại một tệp âm thanh
          chứa cách phát âm đúng, và cũng hợp lý khi thêm một hướng dẫn phát âm dạng văn bản sau các từ khó, theo cách bạn thấy trong các mục từ điển.
        </p>
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio"
          >Nội dung video và âm thanh</a
        >, và
        <a href="https://www.oxfordlearnersdictionaries.com/us/about/pronunciation_english.html"
          >Hướng dẫn phát âm cho từ điển tiếng Anh</a
        >
      </td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem mô tả WCAG cho [Hướng dẫn 3.1 Có thể đọc: Làm cho nội dung văn bản có thể đọc và dễ hiểu](https://w3c.github.io/wcag/guidelines/22/#readable).

## Hướng dẫn 3.2 — Có thể dự đoán: Làm cho các trang web xuất hiện và hoạt động theo những cách có thể dự đoán

Hướng dẫn này tập trung vào việc làm cho giao diện người dùng trực quan và dễ hiểu.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Tiêu chí thành công</th>
      <th scope="col">Cách đáp ứng tiêu chí</th>
      <th scope="col">Tài nguyên thực hành</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3.2.1 Khi focus (A)</td>
      <td>
        <p>
          Khi một điều khiển hoặc tính năng trang khác nhận focus, nó không nên thay đổi ngữ cảnh theo cách có thể làm người dùng bối rối hoặc mất phương hướng.
        </p>
        <p>
          Đây là vấn đề của thiết kế hợp lý - người dùng không muốn giao diện gây bất ngờ; họ muốn mọi thứ trực quan và hoạt động như mong đợi. Ví dụ, việc focus vào một tùy chọn menu điều hướng không nên thay đổi trang đang hiển thị - nó nên được kích hoạt trước khi hiển thị thay đổi.
        </p>
      </td>
      <td>
        Sự kiện {{domxref("Element.focus_event", "focus")}} của
        <code>Element</code> chứa một số thông tin hữu ích. Cũng xem
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#building_keyboard_accessibility_back_in"
          >Xây dựng lại khả năng truy cập bằng bàn phím</a
        >
        để có một số ý tưởng triển khai hữu ích.
      </td>
    </tr>
    <tr>
      <td>3.2.2 Khi nhập dữ liệu (A)</td>
      <td>
        <p>
          Khi dữ liệu được nhập vào một điều khiển, hoặc một cài đặt thay đổi, ngữ cảnh không nên thay đổi một cách bất ngờ. Người dùng nên được cảnh báo/nhắc nhở về thay đổi sắp xảy ra trước khi nó diễn ra.
        </p>
        <p>
          Một lần nữa, nên áp dụng thiết kế hợp lý. Ví dụ, nếu nhấn một nút khiến ứng dụng thoát khỏi chế độ xem hiện tại, người dùng nên được yêu cầu xác nhận hành động này, lưu công việc của họ nếu phù hợp, v.v.
        </p>
      </td>
      <td>
        Sự kiện {{domxref("Element/input_event", "input")}} hữu ích ở đây.
      </td>
    </tr>
    <tr>
      <td>3.2.3 Điều hướng nhất quán (AA)</td>
      <td>
        <p>
          Kiểu dáng và vị trí của menu/điều khiển điều hướng nên nhất quán giữa các trang hoặc chế độ xem khác nhau của một trang web, và các mục hiện có nên xuất hiện theo cùng một thứ tự, ngay cả khi ví dụ có thêm mục mới. Nếu người dùng đã khởi xướng một thay đổi, chẳng hạn chọn một bảng màu khác hoặc vị trí khác cho điều hướng, lựa chọn của họ nên được tôn trọng trên tất cả các trang.
        </p>
        <p>
          Một lần nữa, thiết kế hợp lý - hãy làm cho các điều khiển điều hướng giống nhau trên tất cả các trang hoặc chế độ xem.
        </p>
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#structure_page_sections_logically"
          >Cấu trúc các phần trang một cách hợp lý</a
        >
        để biết thông tin về cách đánh dấu hiện đại cho bố cục. Cũng xem
        <a href="/en-US/docs/Learn_web_development/Core/Text_styling/Styling_links#styling_links_as_buttons"
          >Tạo kiểu liên kết như nút</a
        >
        để có một ví dụ menu điều hướng dễ tiếp cận hữu ích.
      </td>
    </tr>
    <tr>
      <td>3.2.4 Xác định nhất quán (AA)</td>
      <td>
        <p>
          Các điều khiển hoặc thành phần có cùng chức năng nên được xác định theo cùng một cách trên các trang hoặc chế độ xem khác nhau. Ví dụ, một bộ chuyển đổi tiền tệ xuất hiện trên mọi trang của một trang web du lịch thế giới nên hoàn toàn giống nhau, cả về ngữ nghĩa lẫn nhãn.
        </p>
        <p>Một lần nữa, thiết kế hợp lý!</p>
      </td>
      <td>
        "Labels" có thể chỉ thông tin mô tả trong nội dung văn bản, hoặc nhãn của phần tử form HTML. Xem
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_meaningful_text_labels"
          >Dùng nhãn văn bản có ý nghĩa</a
        >
        để biết thêm thông tin.
      </td>
    </tr>
    <tr>
      <td>3.2.5 Thay đổi khi được yêu cầu (AAA)</td>
      <td>
        <p>
          Các thay đổi ngữ cảnh có thể gây bối rối hoặc làm người dùng mất phương hướng chỉ nên xảy ra khi người dùng yêu cầu, HOẶC người dùng phải có thể tắt chúng.
        </p>
        <p>
          Nếu bạn cần một thứ gì đó thay đổi đáng kể chế độ xem hiện tại (ví dụ: nội dung hoặc điều khiển), hãy để người dùng quyết định khi nào họ muốn thay đổi đó xảy ra (ví dụ: trang nào để hiển thị, khi nào chuyển sang ảnh tiếp theo trong bộ sưu tập...)
        </p>
        <p>
          Nếu bạn cần một thứ như carousel trên trang, hãy cung cấp tùy chọn để dừng việc tự động chuyển trang. Tốt hơn là tránh chức năng như vậy nếu có thể.
        </p>
      </td>
 </tr>
      <tr>
      <td> 3.2.6 Trợ giúp nhất quán (A)</td>
      <td> <p> Các trang web có cơ chế trợ giúp, bao gồm tùy chọn tự trợ giúp và thông tin liên hệ con người, nếu được lặp lại trên nhiều trang web, cần đặt các cơ chế đó theo cùng một thứ tự trên tất cả các trang, trừ khi thay đổi được người dùng khởi xướng.</p>
      <td> <p> Hãy xem <a href="https://www.w3.org/WAI/WCAG22/Understanding/consistent-help">tài liệu consistent help</a> cho tiêu chuẩn này để biết thêm. </p>
      </td>
      </td>
      <tr>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem mô tả WCAG cho [Hướng dẫn 3.2 Có thể dự đoán: Làm cho các trang web xuất hiện và hoạt động theo những cách có thể dự đoán](https://w3c.github.io/wcag/guidelines/22/#predictable).

## Hướng dẫn 3.3 — Hỗ trợ nhập liệu: Giúp người dùng tránh và sửa lỗi

Hướng dẫn này tập trung vào việc giúp người dùng nhập đúng thông tin khi cần thiết với số lỗi tối thiểu.

<table class="standard-table">
  <thead>
    <tr>
      <th scope="col">Tiêu chí thành công</th>
      <th scope="col">Cách đáp ứng tiêu chí</th>
      <th scope="col">Tài nguyên thực hành</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3.3.1 Nhận diện lỗi (A)</td>
      <td>
        <p>
          Khi người dùng đang điền form hoặc chọn giữa các tùy chọn, mọi lỗi được phát hiện nên được báo rõ cho người dùng, cùng với điều khiển form liên quan đến lỗi đó.
        </p>
        <p>
          Nên triển khai phát hiện và xử lý lỗi phía client, thông qua các tính năng xác thực form HTML, và/hoặc JavaScript, tùy theo điều gì phù hợp nhất cho tình huống của bạn. Khi phát hiện lỗi, nên hiển thị một thông báo lỗi trực quan bên cạnh input form bị lỗi để giúp người dùng sửa dữ liệu nhập. Với người dùng trình đọc màn hình, bạn có thể dùng vùng sống aria để cảnh báo người dùng về thay đổi trên trang.
        </p>
        <div class="note notecard">
          <p>
            <strong>Ghi chú:</strong> Xác thực phía server <em>luôn</em> nên được
            dùng cùng với xác thực phía client. Xác thực phía client quá dễ
            bị tắt hoặc vượt qua, nên không thể chỉ dựa vào nó.
          </p>
        </div>
      </td>
      <td>
        Xem
        <a href="/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation"
          >Xác thực dữ liệu form</a
        >
        để có thông tin xác thực toàn diện, và
        <a href="/en-US/docs/Learn_web_development/Core/Accessibility/WAI-ARIA_basics#dynamic_content_updates"
          >WAI-ARIA: Cập nhật nội dung động</a
        >
        để biết thông tin về vùng sống.
      </td>
    </tr>
    <tr>
      <td>3.3.2 Nhãn hoặc hướng dẫn (A)</td>
      <td>
        <p>
          Cần cung cấp hướng dẫn rõ ràng khi yêu cầu nhập dữ liệu. Khi cần một hướng dẫn hoặc lời nhắc ngắn, bạn có thể dùng các phần tử {{htmlelement("label")}} cho các input đơn như tên hoặc tuổi, hoặc kết hợp {{htmlelement("label")}} và
          {{htmlelement("fieldset")}}/{{htmlelement("legend")}}
          cho các input nhiều phần đi cùng nhau (như các thành phần của ngày sinh hoặc địa chỉ bưu điện).
        </p>
        <p>
          Khi cần giải thích phức tạp hơn, bạn luôn có thể thêm các đoạn văn giải thích, hoặc có lẽ bạn cần làm cho form của mình trực quan hơn.
        </p>
      </td>
      <td>
        <ul>
          <li>
            <a href="/en-US/docs/Learn_web_development/Core/Accessibility/HTML#use_meaningful_text_labels"
              >Dùng nhãn văn bản có ý nghĩa</a
            >
          </li>
          <li>
            <a href="/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form"
              >Cách cấu trúc form HTML</a
            >
          </li>
          <li>
            <a href="/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Text_labels_and_names"
              >Nhãn và tên văn bản</a
            >
          </li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>3.3.3 Gợi ý sửa lỗi (AA)</td>
      <td>
        <p>
          Khi phát hiện lỗi và biết được gợi ý sửa lỗi, hãy cung cấp chúng cho người dùng (ví dụ: gợi ý lựa chọn thay thế khi người dùng chọn tên người dùng và đã chọn một tên đã có người khác dùng), trừ khi làm vậy sẽ gây ra vấn đề bảo mật (ví dụ: khi nhập mật khẩu) hoặc vấn đề ngữ cảnh (ví dụ: họ đang cố trả lời câu hỏi trong ứng dụng quiz).
        </p>
        <p>
          Trong những trường hợp như vậy, khi phù hợp, bạn có thể sẽ dùng kết hợp JavaScript và chức năng phía server để kiểm tra xem dữ liệu nhập có đúng không, và nếu không, có thể đưa ra những gợi ý khả thi nào cho người dùng. Những gợi ý đó nên được hiển thị một cách hữu ích trong ngữ cảnh, giống như các thông báo lỗi (xem 3.3.1).
        </p>
      </td>
      <td>Chưa có gợi ý hướng dẫn nào.</td>
    </tr>
    <tr>
      <td>3.3.4 Ngăn ngừa lỗi (Pháp lý, tài chính, dữ liệu) (AA)</td>
      <td>
        <p>
          Trong trường hợp các form liên quan đến việc nhập dữ liệu nhạy cảm (như thỏa thuận pháp lý, giao dịch thương mại điện tử, hoặc dữ liệu cá nhân), ít nhất một trong các điều sau phải đúng:
        </p>
        <ul>
          <li>Việc gửi biểu mẫu có thể đảo ngược.</li>
          <li>
            Dữ liệu được kiểm tra lỗi, và người dùng được cho cơ hội sửa chúng.
          </li>
          <li>
            Có sẵn một cơ chế để xác nhận và sửa thông tin trước khi gửi cuối cùng.
          </li>
        </ul>
      </td>
      <td>
        <p>
          <strong>Có thể đảo ngược</strong> — đối với bất kỳ chế độ xem nào có thể nhập dữ liệu, hãy cung cấp một chế độ xem tương đương cho phép bạn chỉnh sửa hoặc thậm chí xóa một mục nhập, nếu phù hợp (ví dụ, xem
          <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django">khung web Django</a
          >).
        </p>
        <p>
          <strong>Kiểm tra dữ liệu</strong> — như đã nêu ở 3.3.1, nên dùng kết hợp xác thực phía client và phía server để phát hiện lỗi và hiển thị thông báo hữu ích cho người dùng để họ sửa dữ liệu nhập.
        </p>
        <p>
          <strong>Xác nhận và sửa</strong> — khi phù hợp, sau khi điền một loạt trường form để thực hiện một tác vụ (như mua sản phẩm), người dùng nên được hiển thị một màn hình xác nhận nơi họ có thể xem lại dữ liệu nhập và sửa bất cứ gì trông không đúng.
          Mẫu này thường được dùng trên các site thương mại điện tử như Amazon.
        </p>
      </td>
    </tr>
    <tr>
      <td>3.3.5 Có sẵn trợ giúp theo ngữ cảnh (AAA)</td>
      <td>
        Cung cấp hướng dẫn và các gợi ý phù hợp khác trong ngữ cảnh để hỗ trợ hoàn thành và gửi form.
      </td>
      <td>
        Điều này thực ra chỉ phát triển từ 3.3.1 và các tiêu chí tương tự khác nhưng đòi hỏi thông tin và dịch vụ trợ giúp theo ngữ cảnh kỹ lưỡng hơn, ví dụ: cung cấp một liên kết riêng tới trang trợ giúp hoặc dịch vụ trên mỗi trang, cung cấp các ví dụ cho thấy kết quả hoàn thành thành công trông như thế nào.
      </td>
    </tr>
    <tr>
      <td>3.3.6 Ngăn ngừa lỗi (Mọi trường hợp) (AAA)</td>
      <td>
        Nguyên tắc này phát triển từ 3.3.4, mở rộng các yêu cầu của nó cho mọi tình huống nhập liệu của người dùng, chứ không chỉ những tình huống liên quan đến dữ liệu nhạy cảm.
      </td>
      <td>Xem lại 3.3.4.</td>
      </tr>
      <tr>
      <td> 3.3.7 Mục nhập trùng lặp (A) </td>
      <td>
      Thông tin bắt buộc đã được người dùng nhập hoặc cung cấp trước đó trong cùng một quy trình hoặc luồng người dùng sẽ được tự động điền sẵn hoặc được người dùng chọn từ một danh sách tùy chọn, trừ khi việc nhập lại thông tin là thiết yếu hoặc bắt buộc vì lý do bảo mật, hoặc nếu thông tin đó không còn hợp lệ.
      </td>
      <td>Xem <a href="https://www.w3.org/WAI/WCAG22/Understanding/redundant-entry">Tìm hiểu mục nhập trùng lặp</a> để tìm hiểu thêm.</td>
      </tr>
      <tr>
      <td> 3.3.8 Xác thực có thể truy cập (Mức tối thiểu) (AA)
      </td>
      <td>
Các bài kiểm tra chức năng nhận thức, như ghi nhớ mật khẩu, không được yêu cầu cho bất kỳ bước nào trong quy trình xác thực trừ khi có một lựa chọn thay thế, chẳng hạn như nhận dạng đối tượng hoặc nội dung cá nhân (ví dụ: hình ảnh, video và âm thanh), hoặc một cơ chế hỗ trợ (ví dụ: sao chép và dán và tự lưu mật khẩu).
      </td>
      <td> Xem <a href="https://www.w3.org/WAI/WCAG22/Understanding/accessible-authentication-minimum"> tài liệu xác thực có thể truy cập</a> cho tiêu chuẩn này để tìm hiểu thêm. </td>
    </tr>
    <tr>
 <td> 3.3.9 Xác thực có thể truy cập (Nâng cao) (AAA) </td>
    <td>
Một bài kiểm tra chức năng nhận thức, như ghi nhớ mật khẩu, không được yêu cầu cho bất kỳ bước nào trong quy trình xác thực nếu không cung cấp lựa chọn thay thế không dựa vào kiểm tra chức năng nhận thức hoặc cung cấp một cơ chế hỗ trợ người dùng hoàn thành bài kiểm tra chức năng nhận thức. Các bài kiểm tra xác thực yêu cầu người dùng nhận diện đối tượng hoặc xác định nội dung không phải văn bản mà người dùng đã cung cấp cho website là được phép.
    </td>
<td> Xem <a href="https://www.w3.org/WAI/WCAG22/Understanding/accessible-authentication-enhanced"> tài liệu xác thực có thể truy cập nâng cao (AAA)</a> để tìm hiểu thêm.</td>
    </tr>
  </tbody>
</table>

> [!NOTE]
> Cũng xem mô tả WCAG cho [Hướng dẫn 3.3 Hỗ trợ nhập liệu: Giúp người dùng tránh và sửa lỗi](https://w3c.github.io/wcag/guidelines/22/#input-assistance).

## Xem thêm

- [WCAG](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG)
  1. [Perceivable](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable)
  2. [Operable](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable)
  3. Dễ hiểu
  4. [Bền vững](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Robust)
