# JADE-WP-Relational-Services-Using-ODBC
This repository contains **ErewhonInvestmentsODBC**, an example JADE schema that accompanies the **Relational Queries Using ODBC** white paper. Also included is **ModelODBC.scm** which contains classes to support the **ErewhonInvestmentsODBC** schema.

## Documentation
The accompanying white paper that also contains instructions for usage of the **ErewhonInvestmentsODBC** schema can be found at https://www.jadeworld.com/jade-platform/developer-centre/documentation/white-papers

## Getting Started
These instructions describe how to load the schema for usage on your machine.

### Prerequisites

Before you can load the schemas, you need JADE 2022 installed. If you are still on JADE 2020, you can load the schemas found in the v2020 branch of the repository.

You may also be able to find versions of the schema for usage with older versions of JADE at https://www.jadeworld.com/jade-platform/developer-centre/documentation/white-papers under the **Archived** section at the bottom, although this is not guaranteed.

1. Grab a FREE Developer's license at https://secure.jadeworld.com/devlicense/.
2. Download the JADE 2022 release at https://www.jadeworld.com/developer-center/download-jade .
3. Open the installer and follow the instructions in the install wizard.
4. JADE is now installed, and a shortcut has been placed in your Start menu. You're good to go!

> For details about installing JADE, see https://secure.jadeworld.com/JADETech/JADE2022/Docs/InstallConfig.pdf.

### Loading the Schemas using JADE Git Integration

**Step 1: Setting your username and email**
1. In the Options menu, select the **Preferences** command.
2. Select the **Source Management** sheet.
3. Enter your name and email address in the **Commit Details** group box inside the **Source Control** group box.
4. Select a valid working directory. (This can be whatever you like, as long as you remember it.)
5. Click the **OK** button.

**Step 2: Cloning Erewhon**
The JADE Erewhon Schema is a prerequisiste for the **ErewhonInvestmentsODBC** schema.
1. In the Browse menu, select the **Clone** command from the Git Source Control Client submenu.
(The local path is filled in for you as the path you selected in Step 1.)
2. For the Repository URL, enter https://github.com/jadesoftwarenz/JADE-Erewhon.
3. Click the **Clone** button.

**Step 3: Loading Erewhon**
1. In the Schema menu, select the **Load** command.
2. Tick the **Load Multiple Files** box.
2. For **Schema File Name** click **Browse** and find the **ErewhonInvestments.mul** file you cloned into the path you selected. This will be inside the **Erewhon** folder.
3. Click the **OK** button, and the Erewhon schemas will be loaded into your Schema Browser ready for use.

**Step 4: Cloning the Repository**
1. In the Browse menu, select the **Clone** command from the Git Source Control Client submenu.
(The local path is filled in for you as the path you selected in Step 1.)
2. For the Repository URL, enter https://github.com/jadesoftwarenz/JADE-WP-Relational-Services-Using-ODBC.
3. Click the **Clone** button.

**Step 3: Load the Schema**
1. In the Schema menu, select the **Load** command.
2. For **Schema File Name** click **Browse** and find the **ModelODBC.scm** file you cloned into the path you selected.
3. Click the **OK** button, and the prerequisite additions to **ErewhonInvestmentsModelSchema** will be loaded.
4. The **ErewhonInvestmentsModelSchema** schema will require reorg. Click the reorg button on the top bar (two crossing arrows). Press **Reorg** and wait for the process to complete.
5. In the Schema menu, select the **Load** command.
6. For **Schema File Name** click **Browse** and find the **ErewhonInvestmentsODBC.scm** file you cloned into the path you selected.
7. For **Forms File Name** click **Browse** and find the **ErewhonInvestmentsODBC.ddx** file you cloned into the path you selected.
8. Click the **OK** button, and the **ErewhonInvestmentsODBC** schema will be loaded into your Schema Browser ready for use.

## Basic Usage Notes
Make sure that the data from the Erewhon schema is generated before you attempt to use the **ErewhonInvestmentsODBC** example. You can do this using the **initializeData** JadeScript in **ErewhonInvestmentsModelSchema**.

## Frequently Asked Questions
**Q.** Can I contribute to or change these schemas?
> The schemas contained in this repository are for demonstration purposes, and as such, are not open to pull requests. However, you are welcome to create a fork and make changes to your own copy, subject to our license ([LICENSE.txt](LICENSE.txt)).

**Q.** What can I do with the **ErewhonInvestmentsODBC** schema?
> Refer to the **Relational Queries Using ODBC** white paper found at https://www.jadeworld.com/jade-platform/developer-centre/documentation/white-papers for detailed instructions on using the schema as well as exaplanations of the concepts it demonstrates.


## License

This project is licensed under the MIT License. See the [LICENSE.txt](LICENSE.txt) file for details.
