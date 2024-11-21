document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.slide-btn');
    
    buttons.forEach(button => {
        button.addEventListener('click', function() {
            buttons.forEach(btn => {
                if (btn !== this) {
                    btn.classList.remove('active');
                }
            });
            this.classList.add('active');
        });
    });
});
