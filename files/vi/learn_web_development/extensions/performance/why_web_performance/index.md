---
title: '"Lý do tại sao" của hiệu suất web'
slug: Learn_web_development/Extensions/Performance/why_web_performance
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Performance/What_is_web_performance", "Learn_web_development/Extensions/Performance")}}

Hiệu suất web là tất cả về việc làm cho website nhanh, bao gồm cả việc làm cho các quy trình chậm _có vẻ_ nhanh. Bài viết này cung cấp phần giới thiệu về lý do tại sao hiệu suất web quan trọng đối với khách truy cập trang web và cho mục tiêu kinh doanh của bạn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, và kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >các công nghệ web phía client</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Để có sự quen thuộc cơ bản về lý do tại sao hiệu suất web quan trọng cho trải nghiệm người dùng tốt.
      </td>
    </tr>
  </tbody>
</table>

Hiệu suất web đề cập đến tốc độ mà nội dung trang web **tải** và **kết xuất** trong trình duyệt web, và mức độ phản hồi tốt với tương tác của người dùng. Các trang web có hiệu suất kém tải chậm và phản hồi đầu vào chậm. Các trang web có hiệu suất kém làm tăng tỷ lệ bỏ trang. Trong trường hợp tệ nhất, hiệu suất kém khiến nội dung hoàn toàn không thể tiếp cận được. Một mục tiêu tốt cho hiệu suất web là để người dùng không nhận thấy hiệu suất. Mặc dù nhận thức của mỗi cá nhân về hiệu suất trang web là chủ quan, nhưng việc tải và kết xuất có thể được đo lường. Hiệu suất tốt có thể không rõ ràng đối với hầu hết khách truy cập trang web, nhưng hầu hết sẽ ngay lập tức nhận ra một trang web chậm chạp. Đó là lý do tại sao chúng ta quan tâm.

## Tại sao quan tâm đến hiệu suất?

Hiệu suất web — và các phương pháp hay nhất liên quan — là điều cần thiết để khách truy cập trang web của bạn có trải nghiệm tốt. Theo một nghĩa nào đó, hiệu suất web có thể được coi là một tập hợp con của [khả năng tiếp cận web](/en-US/docs/Learn_web_development/Core/Accessibility). Với hiệu suất cũng như khả năng tiếp cận, bạn xem xét thiết bị mà khách truy cập đang sử dụng để truy cập trang web và tốc độ kết nối của thiết bị.

Ví dụ, hãy xem xét trải nghiệm tải của CNN.com, tại thời điểm viết bài này có hơn 400 yêu cầu HTTP với kích thước tệp hơn 22,6MB.

- Hãy tưởng tượng tải trang này trên máy tính để bàn kết nối với mạng cáp quang. Điều này có vẻ tương đối nhanh, và kích thước tệp phần lớn không liên quan.
- Hãy tưởng tượng tải cùng trang đó bằng dữ liệu di động được chia sẻ trên iPad chín tuổi trong khi đi làm về bằng phương tiện công cộng. Trang web tương tự sẽ tải chậm, có thể gần như không sử dụng được tùy thuộc vào vùng phủ sóng di động. Bạn có thể bỏ cuộc trước khi nó tải xong.
- Hãy tưởng tượng tải cùng trang đó trên thiết bị chi phí thấp ở khu vực có vùng phủ sóng hạn chế. Trang web sẽ tải rất chậm — nếu nó tải được — với các tập lệnh chặn có thể hết thời gian chờ và tác động CPU bất lợi có thể gây ra sự cố trình duyệt nếu nó tải được.

Một trang web 22,6 MB có thể mất đến 83 giây để tải trên mạng 3G, với [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event) (nghĩa là cấu trúc HTML cơ sở của trang web) ở 31,86 giây.

Và không chỉ thời gian tải xuống mới là vấn đề lớn. Ở một số khu vực, kết nối internet được tính phí theo megabyte, khiến việc tải xuống lớn cực kỳ tốn kém. Trải nghiệm CNN.com 22,6 MB của chúng ta sẽ tiêu tốn một phần đáng kể hạn mức dữ liệu hàng ngày của người dùng di động hoặc thậm chí dẫn đến phí cao trong một số gói chuyển vùng quốc tế.

### Cải thiện tỷ lệ chuyển đổi

Giảm thời gian tải xuống và kết xuất của trang web cải thiện tỷ lệ chuyển đổi và giữ chân người dùng.

**Tỷ lệ chuyển đổi** là tỷ lệ khách truy cập trang web thực hiện một hành động được đo lường hoặc mong muốn. Ví dụ, đây có thể là thực hiện mua hàng, đọc một bài viết hoặc đăng ký nhận bản tin. Hành động được đo lường như tỷ lệ chuyển đổi phụ thuộc vào mục tiêu kinh doanh của trang web.

Hiệu suất ảnh hưởng đến chuyển đổi; cải thiện hiệu suất web cải thiện chuyển đổi. Khách truy cập trang web mong đợi trang web tải trong hai giây hoặc ít hơn; đôi khi thậm chí ít hơn trên di động (nơi thường mất nhiều thời gian hơn). Những khách truy cập trang web này bắt đầu rời bỏ các trang web chậm sau 3 giây.

Tốc độ tải trang web là một yếu tố. Nếu trang web phản hồi chậm với tương tác của người dùng, hoặc có vẻ giật cục, điều này khiến khách truy cập trang web mất hứng thú và tin tưởng.

Dưới đây là một số ví dụ thực tế về cải thiện hiệu suất:

- [Tokopedia đã giảm thời gian kết xuất từ 14 giây xuống 2 giây cho kết nối 3G và thấy mức tăng 19% lượng khách truy cập, tăng 35% tổng số phiên, tăng 7% người dùng mới, tăng 17% người dùng hoạt động và tăng 16% số phiên mỗi người dùng.](https://wpostats.com/2018/05/30/tokopedia-new-users.html)
- [Xây dựng lại các trang Pinterest để tối ưu hiệu suất dẫn đến giảm 40% thời gian chờ, tăng 15% lưu lượng SEO và tăng 15% tỷ lệ chuyển đổi để đăng ký.](https://wpostats.com/2017/03/10/pinterest-seo.html)

Để xây dựng các website và ứng dụng mà mọi người muốn sử dụng; để thu hút và giữ chân khách truy cập trang web, bạn cần tạo ra một trang web có thể tiếp cận cung cấp trải nghiệm người dùng tốt. Xây dựng website yêu cầu HTML, CSS và JavaScript, thường bao gồm các loại tệp nhị phân như hình ảnh và video. Các quyết định bạn đưa ra và các công cụ bạn chọn khi xây dựng trang web của mình có thể ảnh hưởng lớn đến hiệu suất của sản phẩm hoàn chỉnh.

Hiệu suất tốt là một tài sản. Hiệu suất kém là một trách nhiệm. Tốc độ trang web ảnh hưởng trực tiếp đến tỷ lệ thoát, tỷ lệ chuyển đổi, doanh thu, sự hài lòng của người dùng và thứ hạng trên công cụ tìm kiếm. Các trang web có hiệu suất cao đã được chứng minh là tăng khả năng giữ chân khách truy cập và sự hài lòng của người dùng. Nội dung chậm đã được chứng minh là dẫn đến rời bỏ trang web, với một số khách truy cập rời đi và không bao giờ quay lại. Giảm lượng dữ liệu truyền giữa client và server giảm chi phí cho cả hai bên. Giảm kích thước tệp HTML/CSS/JavaScript và đa phương tiện giảm cả thời gian tải và mức tiêu thụ điện năng của trang web (xem [ngân sách hiệu suất](/en-US/docs/Web/Performance/Guides/Performance_budgets)).

Theo dõi hiệu suất là quan trọng. Nhiều yếu tố, bao gồm tốc độ mạng và khả năng thiết bị ảnh hưởng đến hiệu suất. Không có một số liệu hiệu suất duy nhất; và các mục tiêu kinh doanh khác nhau có thể có nghĩa là các số liệu khác nhau có liên quan hơn đến mục tiêu của trang web hoặc tổ chức hỗ trợ nó. Cách hiệu suất trang web của bạn được nhận thức là trải nghiệm người dùng!

## Kết luận

Hiệu suất web quan trọng cho khả năng tiếp cận và cũng quan trọng cho các số liệu trang web khác phục vụ mục tiêu của tổ chức hoặc doanh nghiệp. Hiệu suất tốt hay xấu của trang web tương quan mạnh mẽ với trải nghiệm người dùng, cũng như hiệu quả tổng thể của hầu hết các trang web. Đây là lý do tại sao bạn nên quan tâm đến hiệu suất web.

{{NextMenu("Learn_web_development/Extensions/Performance/What_is_web_performance", "Learn_web_development/Extensions/Performance")}}
