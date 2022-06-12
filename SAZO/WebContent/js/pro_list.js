        var list = document.querySelector('.list');
        var slide = document.querySelectorAll('.list li');
        var currendIdx = 0;
        var slideCount = slide.length;
        var slideWidth = 310;
        var slideMargin = 30;
        var nextBtn = document.querySelector('.arrow_right');
        var prevBtn = document.querySelector('.arrow_left');

        list.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';

        function moveSlide(num) {
            list.style.left = -num * 330 + 'px';
            currendIdx = num;
        }

        nextBtn.addEventListener('click', function() {
            if (currendIdx < slideCount - 3) {
                moveSlide(currendIdx + 1);
            } else {
                moveSlide(0);
                
            }
        });

        prevBtn.addEventListener('click',function(){
            if(currendIdx>0){
                moveSlide(currendIdx -1);
            }else{
                moveSlide(slideCount -3);
            }
        });

