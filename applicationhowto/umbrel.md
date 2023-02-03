

***Umbrel Demostration Videos, Tutorial Steps Videos to Come*** 


During one of the recent Comuunity Q&A and Tech Calls, one of our community members brought up installing [Umbrel](https://umbrel.com/) on The Threefold Grid, I found this to be an amazing resource that allows users to self host their own cloud. Combining this with the abilities of the grid creates a truly incredible resource.  

For this tutorial we will be using  
- Full VM deployment with 4 cores, 8000 mb of ram and 900 gb of storage
- Ubuntu 22.04 image
- Terraform 
- Wiregaurd 
- Umbrel  
- Putty / SSH client of your choice. 


# Setting Up Your Wallets and Accounts to Deploy on The Grid

<img src="https://github.com/threefoldfoundation/info_threefold_pub/blob/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_wallet_5.png?raw=true"  width="25%" height="25%">

The easiest way to fund your deployments on the grid is by using a Threefold Connect Wallet. It is possible to fund your deployments with any stellar wallet. For those with an established Stellar wallet with a balance of TFT, start at "Sending your Stellar TFT to TFChain to be Used for Deployment"

It is available for [Android](https://play.google.com/store/apps/details?id=org.jimber.threebotlogin&hl=en&gl=US) and [iOS](https://apps.apple.com/us/app/threefold-connect/id1459845885).

- Note that for Android phones, you need at minimum Android Nougat, the 8.0 software version.
- Note that for iOS phones, you need at minimum iOS 14.5. It will be soon available to iOS 13.

<details>
	<summary><b>Threefold Connect Installation</b></summary>

Either use the links above, or search for the Threefold Connect App on the Apple Store or the Google Play store. Then install and open the app. If you want to leave a 5 star review of the App, no one here will stop you!

<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_1.png"  width="25%" height="25%">

<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_2.png"  width="25%" height="25%">

When you try to open the App, if you get an error message such as : "Error in initialization in Flagsmith...", you might need to upgrade your phone to a newer software version (8.0 for Android and 13 for iOS).

Once you are in the application, you will see some introduction pages to help you familiarize with the TF Connect App. You will also be asked to read and accept Threefold's Terms and conditions.

<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_3.png"  width="25%" height="25%">

<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_4.png"  width="25%" height="25%">

You will then be asked to either *SIGN UP* or *RECOVER ACCOUNT*. For now, we will show how to sign up. Later in the guide, we will show you how to recover an account.


<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_5.png"  width="25%" height="25%">

You will then be asked to choose a *Threefold Connect Id*. This ID will be used, as well as the seed phrase, when you want to recover an account. Choose wisely. And do not forget it! Here we will use TFExample, as an example.


<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_6.png"  width="25%" height="25%">

Next, you need to add a valid email address. This will be used as a broad KYC. You will need to access your email and confirm the validation email from Threefold to use properly the TF Connect App Wallet.


<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_7.png"  width="25%" height="25%">

Then, the next step is crucial! Make sure no one is around looking at your screen. You will be shown your seed phrase. Keep this in a secure and offline place. You will need the 3bot ID and the seed phrase to recover your account. This seed phrase is of utmost important. Do not lose it nor give it to anyone.


<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_8.png"  width="25%" height="25%">

Once you've hit Next, you will be asked to write down 3 random words of your seed phrase. This is a necessary step to ensure you have taken the time to write down your seed phrase.


<img src="https://github.com/threefoldfoundation/info_threefold_pub/blob/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_9.png?raw=true"  width="25%" height="25%">

Then, you'll be asked to confirm your TF 3bot name and the associated email.


<img src="https://github.com/threefoldfoundation/info_threefold_pub/blob/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_10.png?raw=true"  width="25%" height="25%">

Finally, you will be asked to choose a 4-digit pin. This will be needed to use the Threefold Connect App. If you ever forget this 4-digit pin, you will need to recover your account from your 3bot name and your seed phrase. You will need to confirm the new pin in the next step.


<img src="https://github.com/threefoldfoundation/info_threefold_pub/blob/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_11.png?raw=true"  width="25%" height="25%">

That's it! You've created your Threefold Connect account. You can press the hamburger menu on the top left to explore the Threefold Connect App.


<img src="https://github.com/threefoldfoundation/info_threefold_pub/blob/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_12.png?raw=true"  width="25%" height="25%">

In the next step, we will create a Threefold Connect Wallet. You'll see, it's very simple!

</details>


- <details>
    <summary><b>Verify your identity (KYC) by email</b></summary>

	Once you've created your account, an email will be sent to the email address you've chosen in the account creation process. 

	To verify your email, go on your email account and open the email sent by *info@openkyc.live* with the subject *Verify your email address*. 

	In this email, click on the link *Verify my email address*. This will lead you to a *login.threefold.me* link. The process should be automatic. Once this is done, you will receive a confirmation on screen, as well as on your phone.

	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_39.png"  width="25%" height="25%">

	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_40.png"  width="25%" height="25%">

	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_41.png"  width="25%" height="25%">

	If for some reason, you did not receive the verification email, simply click on *Verify* and another email will be sent.

	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_42.png"  width="25%" height="25%">

	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_43.png"  width="25%" height="25%">

	# Change email associated with TF account

	If you want to change your email, simply click on the *pencil* next to your email and write another email. You will need to redo the KYC verification process.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_44.png"  width="25%" height="25%">

	</details>

- <details>
	<summary><b>Create a Wallet</b></summary>

	To create a wallet, click on the Threefold Connect App menu. This is what you see. Choose *Wallet*.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_13.png"  width="25%" height="25%">

	Once you are in the section *Wallet*, click on *Create Initial Wallet*. If it doesn't work the first time, retry some more. If you have trouble creating a wallet, make sure your connection is reliable. You can try a couple of minutes later if it still doesn't work. With a reliable connection, there shouldn't be any problem. Contact TF Support if problems persist.

	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_14.png"  width="25%" height="25%">

	This is what you see when the TF Grid is initializing your wallet.

	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_15.png"  width="25%" height="25%">

	Once your wallet is initialized, you will see *No blanace found for this wallet*. You can click on this button to enter the wallet.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_16.png"  width="25%" height="25%">

	Once inside your wallet, this is what you see.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_17.png"  width="25%" height="25%">

	We will now see where the Stellar and the TF Chain Addresses and Secrets are to be found. We will also changing the wallet name. To do so, click on the *circled i* at the bottom right of the screen.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_18.png"  width="25%" height="25%">

	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_19.png"  width="25%" height="25%">

	You can choose the name you want for your wallet. Here we use TFWalletExample. Note that you can also use alphanumeric characters.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_20.png"  width="25%" height="25%">

	At the top of the section *Wallet*, we can see that the name has changed.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_21.png"  width="25%" height="25%">

	Now, if you want to copy your Stellar Address, simply click on the button presented with the green circle. To access the TF Chain address, click on the button presented with the red circle. When your phone has copied the address, the TF App will give show a confirmation message as shown below.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_22.png"  width="25%" height="25%">

	In some situations, you will want to access the Stellar and TF Chain secrets. To do so, simply click on the "eye" button of the desired chain, and then copy the secret.


	<img src="https://github.com/threefoldfoundation/info_threefold_pub/raw/wethreepedia_mik/wiki/wethreepedia/farming/img/farming_tf_wallet_23.png"  width="25%" height="25%">

	</details>

<details>
	<summary><b>Buying TFT on the Stellar Decentralized Exchanges with LOBSTR</b></summary>

<h1>How to: Buy TFT With LOBSTR</h1>


The Threefold token (TFT) is the utility token of the The Threefold Grid, a decentralized and open-source project offering network, compute and storage capacity.

Threefold Tokens (TFT) are created (minted) by the ThreeFold Blockchain (TFChain) only when new Internet capacity is added to the ThreeFold Grid by farmers. For this reason, TFT is a pure utility token as minting is solely the result of farming on the Threefold Grid.

* To **farm** TFT, read the [complete farming guide](https://forum.threefold.io/t/threefold-farming-guide-part-1/2989).

* To **buy** TFT, follow this guide.

There are many ways to buy TFT:

* You can buy TFT on [Lobstr](https://lobstr.co/)

* You can buy TFT at [GetTFT.com](https://gettft.com/gettft/)

* You can buy TFT on [Pancake Swap](https://pancakeswap.finance/swap?inputCurrency=BNB&outputCurrency=0x8f0FB159380176D324542b3a7933F0C2Fd0c2bbf)

For the current guide, we will show how to buy TFT on the [Lobstr app](https://lobstr.co/).
The process is simple.

</details>

- <details>
	<summary><b>Download the App and Create an Account</b></summary>

	Go on [www.lobstr.co](https://www.lobstr.co) and download the Lobstr app.
	You can download it for Android or iOS.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_1.png?raw=true"  width="15%" height="15%">

	We will show here the steps for Android, but it is very similar with iOS.
	Once you've clicked on the Android button, you can click install on the Google Store page:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_2.png?raw=true"  width="15%" height="15%">

	Once the app is downloaded, open it:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_3.png?raw=true"  width="15%" height="15%">

	On the Lobstr app, click on **Create Account**:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_4.png?raw=true"  width="15%" height="15%">

	You will then need to enter your email address:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_5.png?raw=true"  width="15%" height="15%">

	Then, choose a safe password for your account:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_6.png?raw=true"  width="15%" height="15%">

	Once this is done, you will need to verify your email.

	Click on **Verify Email** and then go check your email inbox.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_7.png?raw=true"  width="15%" height="15%">

	Simply click on **Verify Email** on the email you've received.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_8.png?raw=true"  width="15%" height="15%">

	Once your email is verified, you can sign in to your Lobstr account:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_9.png?raw=true"  width="15%" height="15%">

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_10.png?raw=true"  width="15%" height="15%">
</details>


- <details><summary><b>Connect Your TF Connect App Wallet</b></summary>

	You will then need to either create a new wallet or connect an existing wallet.

	Since we are working on the Threefold ecosystem, it is very easy and practical to simply connect your Threefold Connect app wallet. You can also create a new wallet.

	Using the TF Connect wallet is very useful and quick. When you buy XLM and swap XLM tokens for TFTs, they will be directly available on your TF Connect app wallet.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_10.png?raw=true"  width="15%" height="15%">

	To connect your TF Connect app wallet, you will need to find your Stellar address and chain secret key.
	This is very simple to do.

	Click on **I have a public or secret key**.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_12.png?raw=true"  width="15%" height="15%">

	As you can see on this next picture, you need the Stellar address and secret key to properly connect your TF Connect app wallet to Lobstr:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_18.png?raw=true"  width="15%" height="15%">

	To find your Stellar address and secret key, go on the TF Connect app and select the **Wallet** section:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_13.png?raw=true"  width="15%" height="15%">

	At the top of the section, click on the **copy** button to copy your Stellar Address:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_17.png?raw=true"  width="15%" height="15%">

	Now, we will find the Stellar secret key.
	At the botton of the section, click on the encircled **i** button:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_14.png?raw=true"  width="15%" height="15%">

	Then, click on the **eye** button to reveal your secret key:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_15.png?raw=true"  width="15%" height="15%">

	You can now simply click on the **copy** button on the right:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_16.png?raw=true"  width="15%" height="15%">

	That's it! You've now connected your TF Connect app wallet to your Lobstr account.
</details>

- <details>
	<summary><b>Buy XLM with Fiat Currency</b></summary>

	Now, all we need to do, is buy XLM and then swap it for TFT.
	It will be directly available in your TF Connect App wallet.

	On the Lobstr app, click on the top right menu button:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_19.png?raw=true"  width="15%" height="15%">

	Then, click on **Buy Crypto**:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_20.png?raw=true"  width="15%" height="15%">

	By default, the crypto selected is XLM. This is alright for us as we will quickly swap the XLM for TFT.

	On the Buy Crypto page, you can choose the type of Fiat currency you want.
	By default it is in USD. To select some othe fiat currency, you can click on **ALL** and see the available fiat currencies:
	)
	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_21.png?raw=true"  width="15%" height="15%">

	You can search or select the current you want for the transfer:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_22.png?raw=true"  width="15%" height="15%">

	You will then need to decide how much XLM you want to buy. Note that there can be a minimum amount.
	Once you chose the desired amount, click on **Continue**.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_23.png?raw=true"  width="15%" height="15%">

	Lobstr will then ask you to proceed to a payment method. In this case, it is Moonpay.
	Note that in some cases, your credit card won't accept Moonpay payments. You will simply need to confirm with them that you agree with transacting with Moonpay. This can be done by phone. Check with your bank and credit card company if this applies.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_24.png?raw=true"  width="15%" height="15%">

	Once you've set up your Moonpay payment method, you will need to process and confirm the transaction:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_25.png?raw=true"  width="15%" height="15%">
	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_26.png?raw=true"  width="15%" height="15%">

	You will then see a processing window.
	This process is usually fast. Within a few minutes, you should receive your XLM.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_27.png?raw=true"  width="15%" height="15%">

	Once you've received your XLM, you will receive a notification:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_28.png?raw=true"  width="15%" height="15%">

	When your transaction is complete, you will see this message:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_29.png?raw=true"  width="15%" height="15%">

	On the Trade History page, you can choose to download the csv file version of your transaction:


	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_30.png?raw=true"  width="15%" height="15%">

	That's it! You've bought XLM on Lobstr and Moonpay.
</details>

- <details>
	<summary><b>Swap XLM for TFT</b></summary>

	Now we want to swap the XLM tokens for the Threefold tokens (TFT).
	This is even easier than the previous steps.

	Go to the Lobstr Home menu and select **Swap**:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_31.png?raw=true"  width="15%" height="15%">

	On the **Swap** page, write "tft" and select the Threefold token:

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_32.png?raw=true"  width="15%" height="15%">

	Select the amount of XLM you want to swap. It is recommended to keep at least 1 XLM in your wallet for transaction fees.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_33.png?raw=true"  width="15%" height="15%">

	Within a few seconds, you will receive a confirmation that your swap is completed:
	Note that the TFT is directly sent on your TF Connect app wallet.

	<img src="https://github.com/Mik-TF/gettft_tutorial/blob/main/img/gettft_34.png?raw=true"  width="15%" height="15%">

	That's it. You've swapped XLM for TFT.

	You can now use your TFT to deploy workloads on the Threefold Grid.

</details>

Note that it is possible to do these steps without connecting the Lobstr wallet to the TF Connect App wallet. But doing this has a clear advantage: when we buy and swap on Lobstr, the TFT is directly accessible on the TF Connect app wallet. Ensure you always maintain a balance of 1 XLM in your Wallet, If you do not your wallet will stop functioning.


<details>
	<summary><b>Sending Your Stellar TFT to TFChain to be used for Deployment</b></Summary>

<h1> How To: Funding Your Account For a Threefold Grid Deployment Deployment</h1>


For this section, we will create an account on the TFChain and transfer TFT from Stellar chain to TFChain. We will then be able to use the TFT and deploy workloads on the Threefold Grid.

It is simple. The main steps are:

* Download the Polkadot extension
* Create an account
* Send TFT from Stellar Chain to TFChain

</details>


- <details><summary><b>Install Polkadot-js Extension</b></summary>

	Go to the Threefold Dashboard: https://dashboard.grid.tf/

	If you don't have the Polkadot extension installed on your browser, you will be able to click on the download link directly on the Threefold Dashboard page:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_1.png?raw=true"  width="50%" height="50%">

	This link will lead you to the Polkadot extension download page: https://polkadot.js.org/extension/
	
	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_2.png?raw=true"  width="50%" height="50%">

	Then, simply click on "Add to Chrome".

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_3.png?raw=true"  width="50%" height="50%">

	Then, confirm by clicking on "Add extension".

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_4.png?raw=true"  width="50%" height="50%">

	You can now access the extension by clicking on the browser's extension button on the top right of the screen, and by then clicking on *polkadot{.js} extension*:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_5.png?raw=true"  width="50%" height="50%">

	Make sure to carefully read the Polkadot message then click on **Understood, let me continue**:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_6.png?raw=true"  width="40%" height="40%">

	Then click on the **plus** symbol to create a new account:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_7.png?raw=true"  width="40%" height="40%">

	For this next step, you should be very careful. Your seed phrase is your only access to your account. Make sure to keep a copy somewhere safe and offline.

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_8.png?raw=true"  width="40%" height="40%">

	After, choose a name for your account and a password:
	
	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_9.png?raw=true"  width="40%" height="40%">

	Your account is now created. You can see it when you open the Polkadot extension on your browser:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_10.png?raw=true"  width="40%" height="40%">

</details>

- <details><summary><b>Create Your Deployment Account</b></summary>

	Now, when you go on the [Threefold Dashboard](https://dashboard.grid.tf/), you can click on the **Connect** button on the top right corner:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_11.png?raw=true"  width="40%" height="40%">

	You will then need to grant the Threefold Dashboard access to your Polkadot account.

	Accept the terms and then write your password to confirm:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_12.png?raw=true"  width="40%" height="40%">

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_13.png?raw=true"  width="40%" height="40%">

	Then, simply click on your account name to access the Threefold Dashboard:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_14.png?raw=true"  width="40%" height="40%">

	Once you open your account, you will want to create a Twin ID. Make sure it is written **::1** in the box and click **Create**. 

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_15.png?raw=true"  width="40%" height="40%">

	You will also be asked to confirm the transaction.

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_13.png?raw=true"  width="40%" height="40%">

	That's it! You've successfully created an account on the TFChain thanks to the Polkadot extension. You can now access the Threefold Dashboard.

	On to the next section! Where we will transfer (or swap) TFT from the Stellar Chain on your Threefold Connect app wallet to the TFChain on the Threefold Dashboard.

	You'll see, this is so easy thanks to the Threefold Dashboard configuration.

</details>



- <details>
	<summary><b>Transfer TFT from Stellar Chain to TF Chain</b></summary>

	On the [Threefold Dashboard](https://dashboard.grid.tf/), click on the **Portal**, then click on **Swap**.

	Make sure the chain **stellar** is selected. Then click **Deposit**, as we want to deposit TFT from the Stellar Chain to the TFChain.

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_16.png?raw=true"  width="40%" height="40%">

	Next, you will want to scan the QR code shown on the screen. Scan the QR code with your Threefold Connect app.

	> Note that you can also manually enter your Stellar Chain address as well as the Twin ID.

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_17.png?raw=true"  width="40%" height="40%">

	Now open up your Threefold Connect app and follow those steps:

	Click on the **Home** menu:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_18.png?raw=true"  width="40%" height="40%">

	Click on **Wallet**:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_19.png?raw=true"  width="40%" height="40%">

	Then, click on **Send Coins**:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_20.png?raw=true"  width="40%" height="40%">

	On the next page, select the **Stellar** chain, then click on **SCAN QR**:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_21.png?raw=true"  width="40%" height="40%">

	This will automatically write the correct address and twin ID.

	You can now write the amount of TFT you wish to send, and then click **SEND**

	> We recommend to try with a small amount of TFT first to make sure everything is OK.
	>
	> The transfer fees are of 1 TFT per transfer.

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_22.png?raw=true"  width="40%" height="40%">

	You will then simply need to confirm the transaction. It is a good opportunity to make sure everything is OK.

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_23.png?raw=true"  width="40%" height="40%">

	You should then receive your TFT on your Dashboard account within a few minutes.

	You can see your TFT balanced on the top of the screen. Here's an example of what it could look like:

	<img src="https://github.com/Mik-TF/dashboardTutorialShort/blob/main/img/dashboard_24.png?raw=true"  width="40%" height="40%">

	> Note: You might need to refresh (reload) the webpage to see the new TFT added to the account.

	That's it! You've swapped TFT from Stellar Chain to TFChain.
</details>







# Steps to Prepare Your Local Machine 

There are a few things you will need installed on your local machine, 

<details>
    <summary><b> Windows Local Machine Preparations </b></summary>
&nbsp;
   <details>
      <summary><b>Windows - Install WSL 2 and Ubuntu 22.04 in Windows</b></summary>

- Make sure you have Windows 10 version 2004 or higher installed. You can check your version by going to Settings > System > About.
- Open the Windows PowerShell as an administrator and run the command 
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

dism.exe /online /enable-feature  /featurename:Microsoft-Hyper-V /all /norestart

# This will enable the Hyper-V, WSL and the Virtual Machine Platform features on your Windows machine.
```
- Download and install the [Linux Kernel Update Package](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
- Set default version to WSL 2 in Powershell
```
wsl --set-default-version 2
```
- Open the Microsoft Store and search for "Ubuntu 22.04 LTS" and select the version provided by Canonical Group Limited, this will download and install the Ubuntu distro on your machine.
- Open the Ubuntu app from your Start menu, this will open the Ubuntu terminal and will take a few minutes to complete the setup.
- Once the setup is complete, you will be prompted to create a new user and password.
- Run sudo apt update and sudo apt upgrade to update and upgrade all the packages on your system.
- Once done, you can now use Ubuntu 22.04 LTS on Windows through the WSL 2.

Please note that WSL 2 requires virtualization support, so make sure that virtualization is enabled in your system's BIOS settings.

That's it! You have successfully installed WSL 2 and Ubuntu 22.04 LTS on your Windows machine. Now you can use Ubuntu commands and install any package you like using apt command.
  </details>
 
  <details>
      <summary><b>Windows -  Install Terraform</b></summary> 

Once we have Installed WSL we are going to install Terraform in WSL

To install Terraform in WSL using apt, follow these steps:

Add the HashiCorp package signing key to your system's keyring by running the following command:
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the HashiCorp APT repository to your system's package manager by running the following command:
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```
Update your system's package list by running the following command:
```
sudo apt update
```
Install Terraform by running the following command:
```
sudo apt install terraform
```
Verify that the installation was successful by running the following command:
```
terraform --version
```
You should see the version of Terraform that you installed displayed.

Now you are ready to use Terraform to deploy the main.tf configuration file. 
  </details>

  <details>
      <summary><b>Windows - Install Putty</b></summary> 

- Download PuTTY executable file from the official website: https://www.putty.org/
- Double-click on the downloaded .exe file to start the installation process
- Follow the instructions on the installation wizard to complete the setup
- Once installed, you can open PuTTY from the Start menu or desktop shortcut

  </details>

  <details>
      <summary><b>Windows -  Install Wiregaurd</b></summary> 

- Download the WireGuard installation package for Windows from the official website: https://wireguard.com/install/
- Double-click on the downloaded .msi file to start the installation process
- Follow the on-screen instructions to complete the installation
- Once installed, you can open the WireGuard application from the Start menu or desktop shortcut

  </details>
</details>

<details>
  <summary><b> Linux Local Machine Preparations </b></summary>
&nbsp;
  <details>
      <summary><b>Linux -  Install Terraform</b></summary> 

To install Terraform on Ubuntu using apt, follow these steps:

Add the HashiCorp package signing key to your system's keyring by running the following command:
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the HashiCorp APT repository to your system's package manager by running the following command:
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```
Update your system's package list by running the following command:
```
sudo apt update
```
Install Terraform by running the following command:
```
sudo apt install terraform
```
Verify that the installation was successful by running the following command:
```
terraform --version
```
You should see the version of Terraform that you installed displayed.

Now you are ready to use Terraform to deploy the main.tf configuration file. 
  </details>

  <details>
      <summary><b>Linux -  Install Wiregaurd</b></summary> 

- Add the WireGuard PPA to your system by running the following command in terminal:
    sudo add-apt-repository ppa:wireguard/wireguard
- Update the package list with the following command:
    sudo apt update
- Install the WireGuard package with the following command:
    sudo apt install wireguard
- Load the WireGuard module into the kernel with the following command:
    sudo modprobe wireguard


  </details>
</details>

 
# Steps to Deploy Your Workload 

If you are working in Linux these steps will be performed in the Terminal, in Windows we will be performing these tasks in WSL 

<details>
&nbsp;
    <summary><b>Create a Directory to Store Your Terraform Deployments</b></summary>

Create a new directory where you want to store your Terraform deployments. This directory can be named anything you like. In this tutorial, we will create a deployments directory in this step and your deployment directory in the next. 

```
mkdir deployments
```
</details>

<details>
&nbsp;
    <summary><b>Create a Directory to Store Your Umbrel Deployment</b></summary>

Create a new directory where you want to store your Umbrel Deployment. This directory can be named anything you like. In this tutorial, we will create a deployments directory and a testdeployment subdirectory inside of it.

```
mkdir deployments/umbrel
```
</details>

<details>
&nbsp;
    <summary><b>Create Your Env.tfvars file</b></summary>

To apply the changes specified in the configuration and create the resources defined in main.tf, you will need to provide values for the variables in your configuration. You can do this by creating a .tfvars file and specifying the values you want to use.

For example, you might create a file called env1.tfvars and include the following contents:

```
MNEMONICS = "your mnemonic phrase here"
NETWORK = "main"
SSH_KEY = "your ssh key here"
```

to do this, we will use nano to create the file in the top level deployments directory 
```
nano /deployments/production.tfvars
```

</details>

<details>
&nbsp;
    <summary><b> Create Your Main.Tf </b></Summary>

you will create a "main.tf" file in your umbrel deployment directory, This file is the "recipe" for the how the grid will create your VM. I have provided an example below, in order to use it we will use nano to copy the contents into a new file in the umbrel deployment directory

```
nano /deployments/umbrel/main.tf

# Paste to contents of your main.tf into the window and press Ctrl+X to save and Y to Confirm
```

  <details>
    <summary> The "Example" Umbrel Main.tf </summary>

```

variable "MNEMONICS" {
  type        = string
  description = "The mnemonic phrase used to generate the seed for the node."
}

variable "NETWORK" {
  type        = string
  default     = "main"
  description = "The network to connect the node to."
}

variable "SSH_KEY" {
  type = string
}


terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}

provider "grid" {
    mnemonics = "${var.MNEMONICS}"
    network   = "${var.NETWORK}"  
}
resource "grid_network" "net1" {
    nodes = [3807]
    ip_range = "10.0.0.0/16"
    name = "Net1"
    description = "MyNetwork1"
    add_wg_access = "true"
}
resource "grid_deployment" "D1" { 
  node = 3807
  network_name = grid_network.net1.name 
  disks { 
	 name = "Disk1" 
	 size = "25" 
  } 
  disks { 
	 name = "Disk2" 
	 size = "900" 
  } 
    vms { 
    name = "VM1" 
    description = "MyVm1" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "6" 
    publicip = "false" 
    publicip6 = "false" 
    memory = "8000" 
    mounts { 
	 disk_name = "Disk1" 
	 mount_point = "/data1" 
	}
	mounts { 
	 disk_name = "Disk2" 
	 mount_point = "/data2" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 

output "wg_config1" { 
  value = grid_network.net1.access_wg_config 
} 
output "ygg_ip1" { 
   value = grid_deployment.D1.vms[0].ygg_ip 
}
output "wiregaurd_ip" {
  value = grid_deployment.D1.vms[0].ip
}
```

</details>

<details>
    <summary> Create your own Main.TF </summary>

If you would like to create your own main.tf there are a couple things you should ensure it has 
- output variable to display both the wiregaurd configuration and the VMs Wiregaurd Address.
- adequate resources for running Umbrel 

<details>
    <summary> Minnimum Specifications </summary>

The absolute minnimum specifications for Umbrel are 

- 2 Cores 
- 2094 Memory
- 25 GB disk 
- Ubuntu OS

It is likely you may need more then this depending on your intended use. 
</details>

<details>
    <summary> Recommended Specifications </summary>

For the best Experience I recommend these minnimum settings 

- 4 Cores
- 8094 Memory
- 900 GB Storage Disk 
- 100 GB OS DISK 
- Ubuntu 22.04

If you're running Umbrel OS on Bitcoin mainnet (default), the storage disk should be at least 750 GB in size (we recommend 1 TB+) so it can store the whole Bitcoin blockchain.
  </details>

</details>
</details>

<details>
&nbsp;
    <summary><b>Deploy Your Main.tf</summary>

  <details>
    <summary> Initialize The Deployment Directory </summary>

In order to prepare the Umbrel Deployment directory once we have inserted the main.tf, we will switch to the directory 

```
cd /deployments/umbrel
```

we will then tell Terraform to initialized the directory 
```
terraform init
```
  </details>
  <details>
  &nbsp;
    <summary> Apply Your Main.tf </summary>


```
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/production.tfvars"
```

Note: You can create multiple .tfvars files and use them to save different configurations. For example, you might create a env2.tfvars file with different values for the variables. To use this file, you would pass the path to it as the `-var-file ption when running terraform apply.

Wait for the terraform apply command to complete. This may take a few minutes. When it's finished, The VM we will be installing umbrel on will be created on the Threefold Grid.
  </details>
</details>


# Steps to Connect to your Deployment 

Now we will need to connect to our deployed workload, for this tutorial we will be making our connection through Wiregaurd that we installed earlier

<details>
&nbsp;
    <summary><b> Connect to the Wiregaurd Network</b></Summary>



<details>
    <summary><b> Retrieve Wiregaurd Configuration from Terraform </b></Summary>


This information is printed in the console after you run the "terraform apply" command, If you have lost the window navigate to your umbrel deployment directory 
```
cd /deployments/umbrel
```
then run the "terraform output" command 
```
terraform output
```

you will see a block of data that looks like this 

```
[Interface]
Address = 100.64.0.2
PrivateKey = "private key"
[Peer]
PublicKey = "public key"
AllowedIPs = 10.0.0.0/16, 100.64.0.0/16
PersistentKeepalive = 25
Endpoint = 195.192.213.240:7607
```

copy this file we will pasting it into a file in the next step. 
</details>

<details> 
    <summary><b>Connect to Wiregaurd Network From Local Machine In Windows</b></summary>

- Create a new Text file with the text editor of your choice (notepad works)
- Paste the contents we copied in the last step into the file 
- Save the file with the .conf extension (wg1.conf) the name of the file will be the name of the connection 
- Open the WireGuard application from the Start menu or desktop shortcut
- Click on the add tunnel button to create a new connection 
- Select the text file you just created an open
- Connect to the VPN by clicking on the toggle switch in the WireGuard application.

</details>

<details> 
    <summary><b>Connect to Wiregaurd Network From Local Machine In linux</b></summary>

- Create a new Text file with the text editor of your choice (notepad works)
- Paste the contents we copied in the last step into the file 
- Save the file with the .conf extension (wg1.conf) the name of the file will be the name of the connection 
- Open the WireGuard application from the Start menu or desktop shortcut
- Click on the add tunnel button to create a new connection 
- Select the text file you just created an open
- Connect to the VPN by clicking on the toggle switch in the WireGuard application.

</details>
</details>

<details>
&nbsp;
    <summary><b> Connect to your VM via SSH</b></summary>

<details>
    <summary>SSH VM From Windows using Putty</summary>


https://youtu.be/NEXuWCggFB8


if you’re running Windows, you might want to use Putty to connect to your Grid VMs. This is possible, but you will need to make sure the ssh key you created your playground profile with is save in the right format. Here’s a quick step by step:


<details>
	<summary><b>Format your SSH Key For Putty Using PuttyGen</b></summary>

First run PuttyGen. Even if you already have a key you want to use, this is the best way to get the public key in the proper format. If you don’t already have a key, choose RSA and hit generate. When you’re done, hit Save private key and write the .ppk file to disk. We’ll use this file in the next step to connect.

If you already had a key or want to return to this step later, hit the Load button and select the ppk file. At the top of the PuttyGen window, you’ll see a field with the public key:

![image](https://user-images.githubusercontent.com/44621168/214651082-2b45b153-2a9b-4026-a627-1dacee5fcb77.png)

Copy the public key from this window, making sure you get everything between ssh-rsa and the key comment rsa-key... in this case. Paste that into the ssh public key field in the playground or Terraform file for your deployment. In case of the playground, also save your profile after doing this.

*Copying and pasting the public key from your ppk file will not work. There are line breaks in the file that get interpreted as extra information when they get passed to the VM. You might have success removing the line breaks manually, but copying the public key from this gui window is the simplest and most reliable way to make this work.*
</details>

Once you have your SSH key Sorted, You will be ready to

<details>
	<summary><b>Connect with Putty</b></summary>

After you’ve added the key to your playground profile or Terraform file, create your deployment. There’s no way to change the SSH key in an existing deployment, you must delete and redeploy. Copy the IP address once the deployment is successful and then open Putty.

In Putty’s config screen, navigate to Connection > SSH > Auth:

![image](https://user-images.githubusercontent.com/44621168/214651140-7dd0999b-44cb-40fd-9c00-034aa550d8af.png)

Hit Browse… and select your ppk file. Then go to Session at the top of the left nav bar and enter your VMs IP address in the Host Name (or IP address) field. Then hit the Open button at the bottom of the window to start your session. When you are prompted for a user name, enter root and you should then get access to a terminal with no password prompt.

If you’re prompted for a password, something went wrong and you won’t be able to log in. Go back and check the steps above, then feel free to post questions or problems in this thread.
  </details>
</details>

<details>
    <summary> SSH VM from Linux </summary>

Linux is natively compatible with the grid and can ssh workloads from the terminal with no additional software, once your are connected to the wiregaurd network just open a terminal and run 

```
ssh root@your.vms.wiregaurd.ip
```

</details>
</details>

# Steps To Install Umbrel on Your Deployment 

Next, we will install Umbrel on the deployment we just created

<details>
&nbsp;
    <summary><b>Update and Upgrade Your VM</b></summary> 

After Connecting to your VM via SSH, run these commands in your terminal for Ubuntu 22.04 
```
apt update && apt upgrade -y 
```

If you encouter an error about a grub update on a pink screen, simply press yes and proceed, this is a incompatability between that update and the hypervisor firmware, it will not affect peformance, but this error can be avoided by running this command prior to updating 
```
apt-mark hold grub-efi-amd64-signed
```


   <details>
            <summary>Jump to Update and Upgrade Your VM Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=199s

   </details>

   <details>
            <summary>Jump to Update and Upgrade Your VM Expected Behavior Section</summary>

Console Input 


Command Success 


   </details>

</details>

<details>
&nbsp;
    <summary><b>Restart Your VM</b></summary> 

```
reboot -f
```

<details>
        <summary>Jump to Restart Your VM Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=236s

   </details>

   <details>
            <summary>Jump to Restart Your VM Expected Behavior Section</summary>

Console Input 


Command Success 
</details>
</details>

<details>
&nbsp;
    <summary><b> Create A New User </b></summary>

We will want to create a new user and make that user a sudoer (admin) to create the New User use 
```
adduser yourusername
```

to make that user a sudoer (admin) you will use 

```
usermod -aG sudo yourusername
```
</details>

<details>
&nbsp;
    <summary><b> Switch to New User </b></summary> 

We will to install/run umbrel as the new user that we just created in order to switch to that user to execute the commands we will use 

```
su yourusername
```

</details>

<details>
&nbsp;
    <summary><b>Install Umbrel</b></summary>

Umbrel Includes single command install functionality, If you've made it to this point breathe a sigh of relief once command to go, run 

```
curl -L https://umbrel.sh | bash
```

This will install Umbrel and anytime you are connected to the wiregaurd network you will be able to access the services provided from your regular web browser at the ip addresses displayed when this script finishes
</details>

# Steps to Attach your Umbrel Deployment to Your Home  Network 

The major benefit to using wiregaurd in the way we have above is the ability to create a private, persistent, link between your home network and your Umbrel deployment, This will require your router to support connecting to Wiregaurd Networks, but once you have performed this step any devices on your network will be able to access the Umbrel Here's some examples of how to do that, 

<details>
&nbsp;
    <summary><b> Connecting an OpenWRT Router to your WireGaurd Network </b></summary>

[Openwrt Wiki Page](https://openwrt.org/docs/guide-user/services/vpn/wireguard/client)

1. Install WireGuard on OpenWRT:
   - Connect to your OpenWRT router via SSH or web interface
   - Install the WireGuard packages: 
     `opkg update`
     `opkg install luci-app-wireguard kmod-wireguard wireguard-tools`
     
2. Configure the WireGuard interface:
   - Go to the Network > Interfaces menu in the LuCI web interface
   - Click on the "Add new interface" button and select "WireGuard"
   - Fill in the interface name, private key, and peer information
   - Set the firewall zone for the WireGuard interface
   
3. Configure the routing:
   - Go to the Network > Routing menu in the LuCI web interface
   - Create a new route, select the WireGuard interface as the source and set the desired target network and gateway
   
4. Enable the WireGuard interface:
   - Go to the Network > Interfaces menu in the LuCI web interface
   - Click on the "Edit" button for the WireGuard interface
   - Change the status to "Enabled"
   - Save the changes and apply them
   
5. Test the connection:
   - Verify that the WireGuard interface has been assigned an IP address
   - Ping a remote host to verify that the routing is working
   - Check the WireGuard logs for any errors or warnings

Note: Make sure to use the information from your Terrafom Output for this Configuration
</details>

<details>
&nbsp;
    <summary><b> Connecting a Pfsense Router to Your WireGaurd Network</b></summary>

[Pfsense Wiregaurd Wiki Page](https://docs.netgate.com/pfsense/en/latest/recipes/wireguard-ra.html)

</details>

<details>
&nbsp;
    <summary><b> Connecting an Asus Router to Your Wiregaurd Network </b></summary>

[Asus FAQ Page](https://www.asus.com/support/FAQ/1048282/)
</details>

<details>
&nbsp;
    <summary><b> Connecting a Gl.Inet router to your Wiregaurd Network</b></summary>

[GL.Inet Wiregaurd Setup Page](https://docs.gl-inet.com/en/3/tutorials/wireguard_client/)

</details>





    
