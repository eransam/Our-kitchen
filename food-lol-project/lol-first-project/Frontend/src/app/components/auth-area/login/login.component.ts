import { Component, OnDestroy, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Unsubscribe } from 'redux';
import { CartModel } from 'src/app/models/cart.model';
import { CredentialsModel } from 'src/app/models/credentials.model';
import { OrderModel } from 'src/app/models/order.model';
import { RoleEnum } from 'src/app/models/role.enum';
import { UserModel } from 'src/app/models/user.model';
import store from 'src/app/redux/store';
import { AuthService } from 'src/app/services/auth.service';
import { NotifyService } from 'src/app/services/notify.service';
import { OrdersService } from 'src/app/services/orders.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit, OnDestroy {
  credentials = new CredentialsModel();
  user: UserModel;
  unsubscribe: Unsubscribe;
  currentCart: CartModel; //Will show only if has open cart
  lastOrder: OrderModel;

  constructor(
    private authService: AuthService,
    private notify: NotifyService,
    private router: Router,
    private ordersService: OrdersService
  ) {}

  ngOnInit() {
    this.user = store.getState().authState.user;
    this.unsubscribe = store.subscribe(() => {
      this.user = store.getState().authState.user;
      console.log('this.use1r: ', this.user);

      if (this.user !== null && this.user.userId !== 5555) {
        this.currentCart = store.getState().cartsState.currentCart;
        // this.lastOrder = this.ordersService.getMostRecentOrder();
        console.log('this.currentCart: ', this.currentCart);
      }
    });
  }

  ngOnDestroy(): void {
    if (this.unsubscribe) {
      this.unsubscribe();
    }
  }

  async submit() {
    try {
        console.log('sdfsdf');

      await this.authService.login(this.credentials);
      //   this.notify.success('You have been logged in');
      console.log('sdfsdf');

      if (this.user.role === RoleEnum.Admin) {
        this.router.navigateByUrl('/admin-home');
      } else this.router.navigateByUrl('/shopping');
    } catch (err: any) {
      this.notify.error('מספר עובד לא קיים במערכת');
    }
  }

  getLoggedInState() {
    if (!this.currentCart && this.user) {
      return 'Start Shopping';
    }
    return 'Resume Shopping';
  }
}
